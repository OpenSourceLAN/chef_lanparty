chef_lanparty Cookbook
================

A small cookbook used to do basic provisioning of systems at Respawn LAN, PAX Australia, and possibly other events too.

It's unlikely this cookbook will be of use to anyone except us, since it's built around
the specifics of our event.

Can be used with chef-solo, eg `chef-solo -o 'lanparty::default'`

Before runing
-------------

If using with chef-solo, install it with:

```
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable -v 0.18.30
```

```
mkdir -p /var/chef/nodes/
mkdir -p /var/chef/cookbooks
git clone https://github.com/opensourcelan/chef_lanparty.git /var/chef/cookbooks/lanparty
ln -s /var/chef/cookbooks/lanparty/chef-repo/roles /var/chef/roles
```

Run it
------

```
chef-solo -o 'role[default]'
```

Included Roles
--------------

* `default` - just installs the users in the package
* `docker` - installs docker
* `router` - sets up DNS, DHCP, a NAT router, NTP, HTTP, TFTP

Attributes
----------

A list of users and their groups and keys in users.rb

See roles/router.json for a list of shorewall related attributes

License and Authors
-------------------
License: GPL

