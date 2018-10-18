
all_users = node['respawn']['users']


all_users.each{|username, user_attributes|

  user username do
  	manage_home true
        home "/home/#{username}"
  	shell '/bin/bash'
        action user_attributes['enabled'] ? :create : :remove
  end

  if user_attributes['enabled']
    directory "/home/#{username}/.ssh/" do
    	mode '0700'
        recursive true
    	owner username
    	group username
    end

    file "/home/#{username}/.ssh/authorized_keys" do
    	mode '0500'
    	owner username
    	group username
    	content user_attributes['key']
    end
  end
}

node['respawn']['groups'].map{|respawn_group| 

  group_users = all_users.select{ |u| all_users[u]['groups'].include?(respawn_group) && all_users[u]['enabled'] == true }.map{ |u| u.first }

  group respawn_group do

    members group_users
    
  end

}

file "/etc/sudoers.d/admin" do
	content "\%admin ALL=(ALL) NOPASSWD:ALL"
	owner "root"
	group "root"
	mode "0600"
end
