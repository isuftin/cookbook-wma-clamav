name             'wma-clamav'
maintainer       'Ivan Suftin'
maintainer_email 'isuftin@usgs.gov'
license          'CPL-1.0'
description      'Installs/Configures CIS STIG benchmarks'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'
source_url		 'https://github.com/USGS-CIDA/cookbook-wma-clamav'
issues_url		 'https://github.com/USGS-CIDA/cookbook-wma-clamav/issues'

supports         'centos', '>= 6.6'
supports         'centos', '>= 7.1'

chef_version '>= 12.0.0'
