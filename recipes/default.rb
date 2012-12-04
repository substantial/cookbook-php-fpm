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

packages = %w{php php-fpm php-common php-cli php-pear}

packages.each do |package|
  package package do
    action :upgrade
    options "--enablerepo=remi"
  end
end
