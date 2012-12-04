#
# Cookbook Name:: php-fpm
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "yum::epel"
include_recipe "php-fpm::yum-remi"
include_recipe "php"

packages = %w{php-fpm php-common php-gd php-mysql php-mbstring php-xml php-mcrypt}

node.default["php-fpm"]["conf_dir"] = node["php"]["conf_dir"]

packages.each do |package|
  package package do
    action :upgrade
    notifies :restart, "service[php-fpm]"
  end
end

template "#{node['php-fpm']['conf_dir']}/php-fpm.conf" do
  source "php-fpm.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[php-fpm]"
end

service "php-fpm" do
  supports :start => true, :stop => true, :status => true, :restart => true, :reload => true
  action [:start, :enable]
  subscribes :restart, "template[#{node['php']['conf_dir']}/php.ini]"
end
