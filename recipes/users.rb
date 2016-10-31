
all_users = node['respawn']['users']

all_users.map{|respawn_user| 
  username = respawn_user.first
  user username do
  	manage_home true
  	shell '/bin/bash'
    
  end

  directory "/home/#{username}/.ssh/" do
  	mode '0700'
  	owner username
  	group username
  end

  file "/home/#{username}/.ssh/authorized_keys" do
  	mode '0500'
  	owner username
  	group username
  	content respawn_user.last['key']
  end



}

node['respawn']['groups'].map{|respawn_group| 

  group_users = all_users.select{ |u| all_users[u]['groups'].include?(respawn_group) }.map{ |u| u.first }

  group respawn_group do

    members group_users
    
  end

}
