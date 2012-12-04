maintainer       "Substantial"
maintainer_email "aaron@substantial.com"
license          "All rights reserved"
description      "Installs/Configures php-fpm"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "yum"

%w{scientific}.each do |os|
  supports os
end
