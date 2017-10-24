

package "ntp"

template "/etc/ntp.conf" do
	source "ntpd/ntp.conf.erb"
	variables ({})
	notifies :restart, "service[ntp]", :delayed
end

service "ntp"