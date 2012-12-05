actions :create
default_action :create

attribute :name, :kind_of => String, :name_attribute => true
attribute :user, :kind_of => String, :default => "apache"
attribute :group, :kind_of => String, :default => "apache"
attribute :listen, :kind_of => String, :default => "127.0.0.1:9000"
attribute :pm, :kind_of => String, :default => "dynamic"
attribute :pm_max_children, :kind_of => Integer, :default => 50
attribute :pm_start_servers, :kind_of => Integer, :default => 5
attribute :pm_min_spare_servers, :kind_of => Integer, :default => 5
attribute :pm_max_spare_servers, :kind_of => Integer, :default => 35
attribute :enabled, :default => true
