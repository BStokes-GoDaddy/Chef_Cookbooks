#
# Cookbook Name:: LinuxServers
# Recipe:: serverAws
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'aws::default'
include_recipe 'aws-codedeploy-agent::default'
include_recipe 'LinuxServers::pkgUnzip'

# update OpenSSL, and insure the default bin links to it
include_recipe 'openssl-source::default'

openSslBin = "#{node['openssl_source']['openssl']['prefix']}/bin/openssl"
linkBin = '/usr/bin/openssl'

link linkBin do
  action :delete
  only_if 'test -L #{linkBin}'
end

link linkBin do
  to openSslBin
end
