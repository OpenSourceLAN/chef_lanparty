
package "shorewall"

shorewall_conf_path = "/etc/shorewall"
conf = node['shorewall']

script "enable ip forwarding" do
	interpreter 'bash'
	code "sysctl net.ipv4.ip_forward=1"
end

template "#{shorewall_conf_path}/policy" do
	source "shorewall/policy.erb"
	variables ({
		"default_policy" => conf.fetch('default_policy', "ACCEPT"),
		"policies" => conf.fetch('policies', {}).values
		})
	notifies :restart, "service[shorewall]", :delayed
end

interfaces = []
conf.fetch("zones", {}).map do |zone, ifaces|
	ifaces.map do |iface, props|
		prop = (props || {}).keys.join(",")
		interfaces.push "#{zone} #{iface} detect #{prop}"
	end
end

file "#{shorewall_conf_path}/interfaces" do
	content interfaces.join("\n") + "\n"
	notifies :restart, "service[shorewall]", :delayed
end

file "#{shorewall_conf_path}/zones" do
	content "fw firewall\n" + conf.fetch("zones", {}).keys.map{|zone| "#{zone} ipv4"}.join("\n") + "\n"
	notifies :restart, "service[shorewall]", :delayed
end

file "#{shorewall_conf_path}/masq" do
	content conf.fetch("masq", {}).values.map{|masq| "#{masq['out']} #{masq['in']} #{masq['via']}"}.join("\n") + "\n"
	notifies :restart, "service[shorewall]", :delayed
end

directory "#{shorewall_conf_path}/rules.d"

file "#{shorewall_conf_path}/rules" do
	content "?SECTION NEW\nSHELL cat /etc/shorewall/rules.d/*.rules \n"
	notifies :restart, "service[shorewall]", :delayed
end

file "#{shorewall_conf_path}/rules.d/10_default.rules" do
	content "\n"
	notifies :restart, "service[shorewall]", :delayed
end

include_recipe "lanparty::shorewall_rules"

# this is a default in shorewall.conf. Don't want to rewrite the whole conf file
file "/var/log/messages"

service "shorewall"