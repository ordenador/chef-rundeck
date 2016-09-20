name              'rundeck'
maintainer        'Panagiotis Papadomitsos'
maintainer_email  'pj@ezgr.net'
license           'Apache 2.0'
description       'Installs and configures the Rundeck administration console'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md')).chomp
begin
  version IO.read(File.join(File.dirname(__FILE__), 'VERSION')).chomp
rescue
  '0.1.0'
end

recipe            'rundeck', 'Installs the Rundeck administration console'

depends           'yum'
depends           'apt'
depends           'java'
depends           'logrotate'
depends           'partial_search'

depends           'supervisor'
depends           'nginx'
depends           'openresty'

supports          'ubuntu', '>= 12.04'
supports          'debian', '>= 6.0'
supports          'centos', '>= 6.0'
supports          'redhat', '>= 9.0'
