

script 'install_docker'  do
	interpreter "bash"
	code <<-EOS
	  /usr/bin/curl -fsSL https://experimental.docker.com/ | /bin/sh
	EOS
	not_if "which docker"
end

script 'create docker network' do
	code <<-EOS
		docker network create -d ipvlan --subnet=10.0.0.0/24 -o parent=eth0 --ip-range 10.0.0.16/28 gameservers
	EOS
	not_if "docker network ls | aws '{print $2}' | grep gameservers"
end
