
which chef-solo >/dev/null || (echo "No chef-solo found, please install it" && exit 1)

chef-solo --config chef-config.rb $@
