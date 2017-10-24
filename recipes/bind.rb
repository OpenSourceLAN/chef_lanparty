
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
			{"name" => "@", "type" => "A", "target" => "10.10.0.1"},
			{"name" => "*", "type" => "A", "target" => "10.10.0.1"},
			{"name" => "ns", "type" => "A", "target" => "10.10.0.1"}
		],
		"ttl" => "1m"}
end

template "/etc/bind/named.conf.local" do
	owner binduser
	group binduser
	source 'bind/named.conf.local.erb'
	variables ({
		"zones" => cache_zones + inaddrarpa_zones + local_zones + dynamic_zones,
		"zonefile_location" => zonefile_location
		})
	notifies :reload, "service[bind9]", :delayed
end

template "/etc/bind/named.conf" do
	owner binduser
	group binduser
	source 'bind/named.conf.erb'
	notifies :reload, "service[bind9]", :delayed
end

template "/etc/bind/named.conf.options" do
	owner binduser
	group binduser
	source 'bind/named.conf.options.erb'
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


service "bind9"
