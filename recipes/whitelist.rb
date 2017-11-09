#
# Cookbook Name:: wma-clamav
# Recipe:: whitelist
# Author: Ivan Suftin <isuftin@usgs.gov>
#
# Description: Creates a whitelist for files and virus signatures for ClamAV

clamav_config_dir = node['wma']['clamav']['config']['dir']
signatures = node['wma']['clamav']['config']['whitelist']['signatures']['definitions']
signatures_config_file = node['wma']['clamav']['config']['whitelist']['signatures']['config_file']
files = node['wma']['clamav']['config']['whitelist']['files']['definitions']
files_config_file = node['wma']['clamav']['config']['whitelist']['files']['config_file']
user = node['wma']['clamav']['config']['user']
group = node['wma']['clamav']['config']['group']

directory clamav_config_dir do
  owner user
  group group
  mode '0o755'
  not_if { File.directory?(clamav_config_dir) }
end

template signatures_config_file do
  owner user
  group group
  mode '0o644'
  source 'whitelist_signatures.ign2.erb'
  variables(
    signatures: signatures
  )
  only_if { !signatures.empty? }
end

template files_config_file do
  owner user
  group group
  mode '0o644'
  source 'whitelist_files.erb'
  variables(
    files: files
  )
  only_if { !files.empty? }
end
