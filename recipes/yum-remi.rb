yum_key "RPM-GPG-KEY-remi" do
  url "http://rpms.famillecollet.com/RPM-GPG-KEY-remi"
  action :add
end

major = node['platform_version'].to_i

yum_repository "remi" do
  description "Les RPM de remi pour Enterprise Linux #{major}"
  mirrorlist "http://rpms.famillecollet.com/enterprise/#{major}/remi/mirror"
  url ""
  enabled true
  key "RPM-GPG-KEY-remi"
  action :add
end
