#
# Cookbook Name:: LinuxServers
# Recipe:: apache2
#
# Copyright (c) 2016 Bill Stokes, All Rights Reserved.
include_recipe 'apache2::default'
include_recipe 'apache2::mod_ssl'
include_recipe 'apache2::mod_proxy_http'
include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_vhost_alias'

service 'apache2' do
  supports :status => true
  action [:enable, :start]
end

# Create the document root directory.
directory node['LinuxServers']['pkgApache2']['document_root'] do
  recursive true
end

# Write the home page.
file "#{node['LinuxServers']['pkgApache2']['document_root']}/index.html" do
  content '<html>Site is feeling bland at the moment...</html>'
  mode '0644'
  owner node['LinuxServers']['pkgApache2']['user']
  group node['LinuxServers']['pkgApache2']['group']
end
