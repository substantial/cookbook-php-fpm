action :create do
  if new_resource.enabled
    template "#{node['php-fpm']['conf_dir']}/php-fpm.d/#{new_resource.name}.conf" do
      source "pool.conf.erb"
      owner "root"
      group "root"
      mode "0644"
      variables(
        :name => new_resource.name,
        :user => new_resource.user,
        :group => new_resource.group,
        :listen => new_resource.listen,
        :pm => new_resource.pm,
        :pm_max_children => new_resource.pm_max_children,
        :pm_start_servers => new_resource.pm_start_servers,
        :pm_min_spare_servers => new_resource.pm_min_spare_servers,
        :pm_max_spare_servers => new_resource.pm_max_spare_servers,
      )
      cookbook "php-fpm"
      action :create
      notifies :restart, "service[php-fpm]"
    end
  else
    file "#{node['php-fpm']['conf_dir']}/php-fpm.d/www.conf" do
      action :delete
      notifies :restart, "service[php-fpm]"
    end
  end
end
