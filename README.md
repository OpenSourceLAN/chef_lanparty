respawn Cookbook
================

A small cookbook used to do basic provisioning of systems at Respawn LAN, PAX Australia, and possibly other events too.

It's unlikely this cookbook will be of use to anyone except us, since it's built around
the specifics of our event.

Can be used with chef-solo, eg `chef-solo -o 'respawn::default'`

Install chef solo with something like:

```
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable -v 0.18.30
```

Before runing
-------------
```
mkdir -p /var/chef/nodes/
mkdir -p /var/chef/cookbooks
git clone https://github.com/opensourcelan/chef_respawn.git /var/chef/cookbooks/respawn
```

Attributes
----------

A list of users and their groups and keys in users.rb


License and Authors
-------------------
License: GPL

