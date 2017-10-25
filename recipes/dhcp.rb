
package "isc-dhcp-server"

if node['enable_rndc'] then
	include_recipe 'lanparty::rndc'
end

template '/etc/dhcp/dhcpd.conf' do 
	source 'dhcp/dhcpd.conf.erb'
	variables ({
		"dynamicdomainname" =>  "dyn.pax.lan",
		"domainname" => "pax.lan",
		"dnsearch" => ["pax.lan", "dyn.pax.lan"],
		"dnsservers" => ["10.10.0.1"],
		"serveridentifier" => "10.10.0.1",
		"servername" => "routertest",
		"subnets" => node['subnets'].values,  
		"rndc" => node['enable_rndc']
	})

	notifies :restart, 'service[isc-dhcp-server]', :delayed
end

directory "/etc/dhcp/conf.d/"

service "isc-dhcp-server"
