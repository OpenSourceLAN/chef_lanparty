require 'ipaddr'
require 'resolv'

IPAddr.class_eval do
  def subnetmask
    IPAddr.new(@mask_addr, Socket::AF_INET).to_s
  end
end

binduser = "bind"
zonefile_location = "/var/lib/bind/"

package "bind9"

if node['enable_rndc'] then
	include_recipe 'lanparty::rndc'
end

cache_zones = ["client-download.steampowered.com"].map do |domain|
	{ "name" => domain + ".", "file" => "db.cache" }
end

inaddrarpa_zones = node['subnets'].values.map do |subnet|
	net = IPAddr.new subnet['net']
	{
		# Does this need a trailing `.` ?
		"name" => Resolv::IPv4.create(net.to_s).to_name.to_s.gsub(/^(0\.)+/, ""),
		"file" => "db." + net.to_s.gsub(/(\.0)*$/, ''),
		"rndc" => "rndc-key"
	}
end

dynamic_zones = ["dyn.pax.lan"].map do |domain|
	{"name" => domain + ".", "file" => "db." + domain, "rndc" => "rndc-key"}
end

local_zones = ["pax.lan"].map do |domain|
	{"name" => domain + ".", "file" => "db." + domain, "records" => [
			{"name" => "@", "type" => "A", "target" => "10.11.0.2"},
#			{"name" => "*", "type" => "A", "target" => "10.10.0.1"},
			{"name" => "ns", "type" => "A", "target" => "10.11.0.2"},
                        {"name" => "ntp", "type" => "A", "target" => "10.11.0.2"},
                        {"name" => "heartbeat", "type" => "A", "target" => "10.11.0.2"},
                        {"name" => "router1", "type" => "A", "target" => "10.10.0.2"},
                        {"name" => "router2", "type" => "A", "target" => "10.10.0.3"},
                        {"name" => "pcfp", "type" => "CNAME", "target" => "pcfp.server.lan."},
                        {"name" => "byocapp", "type" => "CNAME", "target" => "byocapp.server.lan."},
                        {"name" => "kubemaster", "type" => "CNAME", "target" => "kubemaster.dyn.pax.lan."},
                        {"name" => "unifi", "type" => "A", "target" => "103.79.72.156"},
		],
		"ttl" => "1m"}
end

forwarded_zones = [ { "name" => "server.lan.", "forwarders" => [ "10.11.16.1" ] } ]


template "/etc/bind/named.conf" do
	owner binduser
	group binduser
	source 'bind/named.conf.erb'
	notifies :reload, "service[bind9]", :delayed
end

(inaddrarpa_zones + dynamic_zones).each do |zone|
	template "#{zonefile_location}#{zone['file']}" do
		owner binduser
		group binduser
		source "bind/zonefile.erb"
		action :create_if_missing
		variables zone
		notifies :reload, "service[bind9]", :delayed
	end
	# file "/etc/bind/#{zone['file']}.jnl" do
	# 	owner binduser
	# 	group binduser
	# 	action :create_if_missing
	# 	notifies :reload, "service[bind9]", :delayed
	# end
end

local_zones.each do |zone|
	template "#{zonefile_location}#{zone['file']}" do
		owner binduser
		group binduser
		source "bind/zonefile.erb"
		action :create
		variables zone
		notifies :reload, "service[bind9]", :delayed
	end

end


template "#{zonefile_location}db.cache" do
	owner binduser
	group binduser
	source "bind/zonefile.erb"
	variables ({"name" => "@", "records" => [
			{"name" => "@", "type" => "A", "target" => "10.11.12.13"},
			{"name" => "*", "type" => "A", "target" => "10.11.12.13"}
		],
		"ttl" => "1m"
	})
	notifies :reload, "service[bind9]", :delayed
end

# build cache domain poisioning

cache_repo = "/opt/cache-domains"

git cache_repo do
  repository 'https://github.com/uklans/cache-domains.git'
  revision 'master'
  action :sync
end

cache_domains = JSON.parse(File.read("#{cache_repo}/cache_domains.json"))
cache_zone_files = []
cache_cname = 'cache.pax.lan'

zones_we_cache = [
#  "apple",
#  "arenanet",
  "blizzard",
#  "daybreak",
#  "frontier",
  "hirez",
#  "minecraft",
#  "nexusmods",
#  "nintendo",
  "origin",
#  "renegadex",
  "riot",
#  "rockstar",
#  "sony",
  "steam",
#  "uplay",
#  "twitch",
  "wargaming",
#  "wsus",
#  "xboxlive"
]

zones_to_cache = cache_domains['cache_domains'].map{|c| c['name']} & zones_we_cache
puts "Caching these domains: "
puts zones_to_cache

cache_domains['cache_domains'].each do |cdn|
	# skip cache domains we don't support
	if not zones_to_cache.include?(cdn['name'])
		puts "Skipping #{cdn['name']} because we don't support it"
		next
	end

	text=File.open("#{cache_repo}/#{cdn['domain_files'][0]}").read
	text.gsub!(/\r\n?/, "\n")
        all_domains = text.split("\n").compact
#	text.each_line do |line|
#		print "#{line_num += 1} #{line}"
#	end
	puts all_domains 

	template "#{zonefile_location}db.rpz.#{cdn['name']}" do
        	owner binduser
	        group binduser
	        source "bind/zonefile.erb"
	        variables ({"name" => "@", "records" => 
				all_domains.map{ |d|
					{"name" => d, "type" => "CNAME", "target" => "cache1.server.lan."}
				},
                	"ttl" => "1m"
        	})
	        notifies :reload, "service[bind9]", :delayed
	end
	
	cache_zone_files.push("#{zonefile_location}db.rpz.#{cdn['name']}")

end

custom_overrides = [
	{"name" => "dockerreg.lanadmins.net", "type" => "CNAME", "target" => "squid.dyn.pax.lan."} # TODO: change this to a real server
]
custom_overrides_file = "#{zonefile_location}db.rpz.custom_overrides"
template custom_overrides_file do
        	owner binduser
        group binduser
        source "bind/zonefile.erb"
        variables ({"name" => "@", "records" =>  custom_overrides, "ttl" => "1m"})
        notifies :reload, "service[bind9]", :delayed
end
zones_to_cache.push("custom_overrides")

template "/etc/bind/named.conf.options" do
        owner binduser
        group binduser
        source 'bind/named.conf.options.erb'
	# variables add all rpz zone files
	variables ({
		"rpz_zones" => cache_zone_files,
		"cache_zones" => zones_to_cache.map{|z| { "name" => z}},
	})
        notifies :reload, "service[bind9]", :delayed
end

# template "#{zonefile_location}db.pax.lan" do
# 	owner binduser
# 	group binduser
# 	source "bind/zonefile.erb"
# 	variables ({"name" => "@", "records" => [
# 			{"name" => "@", "type" => "A", "target" => "10.10.10.1"},
# 			{"name" => "ns", "type" => "A", "target" => "10.10.10.1"},
# 		],
# 		"ttl" => "1m"
# 	})
# 	notifies :reload, "service[bind9]", :delayed
# end

template "/etc/bind/named.conf.local" do
	owner binduser
	group binduser
	source 'bind/named.conf.local.erb'
	variables ({
		"zones" => cache_zones + inaddrarpa_zones + local_zones + dynamic_zones,
		"zonefile_location" => zonefile_location,
                "forwarded_zones" => forwarded_zones,
		"cache_zones" => zones_to_cache.map{|z| { "name" => z}},
		})
	notifies :reload, "service[bind9]", :delayed
end

service "bind9"
