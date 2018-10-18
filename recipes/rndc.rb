
rndc_path_bind = '/etc/bind/rndc.key'
rndc_path_dhcp = '/etc/dhcp/ddns-keys/rndc.key'



# Creates a more secure key file than default, and duplicates it
# so that both bind and dhcpd's apparmor profiles allow access

script 'create rndc key' do
	interpreter 'bash'
	code <<-EOF
		rndc-confgen -A hmac-sha256 -r /dev/urandom -a -c #{rndc_path_bind}
		
# TODO LATER: fix this permissions to not be shit
		chmod 644 #{rndc_path_bind} 
		cp #{rndc_path_bind} #{rndc_path_dhcp}

		chown bind:bind #{rndc_path_bind}
		#chown dhcpd:dhcpd #{rndc_path_dhcp}

	EOF
	not_if { ::File.exist?(rndc_path_dhcp)}
	notifies :restart, "service[isc-dhcp-server]", :delayed
	notifies :reload, "service[bind9]", :delayed

end
