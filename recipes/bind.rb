
require 'ipaddr'
IPAddr.class_eval do
  def subnetmask
    IPAddr.new(@mask_addr, Socket::AF_INET).to_s
  end
end


package "bind9"

if node['enable_rndc'] then
	include_recipe 'lanparty::rndc'
end

cache_zones = ["client-download.steampowered.com"].map do |domain|
	{ "name" => domain, "file" => "db.cache" }
end

# TODO combine this with the attributes from dhcp
inaddrarpa_zones = [			{ "name" => "10.10.in-addr.arpa.", "file" => "db.10.10", "rndc" => "rndc-key" },
			{ "name" => "11.10.in-addr.arpa.", "file" => "db.10.11", "rndc" => "rndc-key" },
			{ "name" => "12.10.in-addr.arpa.", "file" => "db.10.12", "rndc" => "rndc-key" },
			{ "name" => "13.10.in-addr.arpa.", "file" => "db.10.13", "rndc" => "rndc-key" },
			{ "name" => "14.10.in-addr.arpa.", "file" => "db.10.14", "rndc" => "rndc-key" },
			{ "name" => "15.10.in-addr.arpa.", "file" => "db.10.15", "rndc" => "rndc-key" },
			{ "name" => "16.10.in-addr.arpa.", "file" => "db.10.16", "rndc" => "rndc-key" }]

local_zones = ["pax.lan"].map do |domain|
	{"name" => domain}

end

template "/etc/bind/named.conf.local" do
	source 'bind/named.conf.local.erb'
	variables ({
		"zones" => cache_zones + inaddrarpa_zones + local_zones
		})
	notifies :reload, "service[bind9]", :delayed
end

template "/etc/bind/named.conf" do
	source 'bind/named.conf.erb'
	notifies :reload, "service[bind9]", :delayed
end

template "/etc/bind/named.conf.options" do
	source 'bind/named.conf.options.erb'
	notifies :reload, "service[bind9]", :delayed
end

service bind9
