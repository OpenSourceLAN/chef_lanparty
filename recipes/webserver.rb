

package "nginx"
package "php-fpm"


directory "/var/www/csgo"

template "/etc/nginx/sites-enabled/csgo.conf" do
	source "webserver/phpsite.conf.erb"
	variables ({
		"servername" => "csgoadmin.pax.lan",
		"docroot" => "/var/www/csgo",
		})
	notifies :reload, "service[nginx]", :delayed
end 


service "nginx"