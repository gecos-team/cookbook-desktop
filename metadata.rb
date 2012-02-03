name              "desktop"
version           "0.1.1"
maintainer        "Juanje Ojeda"
maintainer_email  "juanje.ojeda@gmail.com"
license           "Apache 2.0"
description       "LWRP to manage the user's desktop settings"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))


%w{ ubuntu debian }.each do |os|
  supports os
end

