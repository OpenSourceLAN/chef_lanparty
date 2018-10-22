
package "isc-dhcp-server"

if node['enable_rndc'] then
	include_recipe 'lanparty::rndc'
end



template '/etc/dhcp/dhcpd.conf' do 
	source 'dhcp/dhcpd.conf.erb'
	variables ({
                "authoritative" => node['dhcp']['authoritative'],
		"dynamicdomainname" =>  "dyn.pax.lan",
		"domainname" => "pax.lan",
		"dnsearch" => ["pax.lan", "server.lan", "dyn.pax.lan"],
		"dnsservers" => ["10.11.0.2"],
		"serveridentifier" => "10.11.0.2",
		"servername" => "heartbeat",
		"subnets" => node['subnets'].values,  
		"rndc" => node['enable_rndc']
	})

	notifies :restart, 'service[isc-dhcp-server]', :delayed
end

directory "/etc/dhcp/conf.d/"
file "/etc/dhcp/conf.d/ignoreme.conf"

service "isc-dhcp-server"
