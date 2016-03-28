#
# Cookbook Name:: LinuxServers
# Recipe:: default
#
# Copyright (c) 2016 Bill Stokes, All Rights Reserved.

# Insure current sources and patches are in place before starting
include_recipe "LinuxServers::serverAws"
include_recipe "LinuxServers::serverApache"
include_recipe "LinuxServers::serverPython"


# include_recipe 'apt::default'
# include_recipe 'auto-patch::default'
# include_recipe 'firewall::default'
# include_recipe 'memcached::default'
# include_recipe 'apache::default'
#
#
# include_recipe 'LinuxServers::pkgUnzip'
# include_recipe 'LinuxServers::pkgPython2'
# include_recipe 'LinuxServers::userWebAdmin'
# include_recipe 'LinuxServers::serviceApache2'
# include_recipe 'LinuxServers::serviceUwsgi'
#
# # we do this since we build/update instances that are not constantly running
# execute 'apt-upgrade' do
#   command         'apt-get upgrade -y'
#   action          :run
#   ignore_failure  true
# end
#
# # Memcache and necessary supporting packages
# %w{zlib1g-dev libssl-dev libbz2-dev gettext libgmp-dev}.each do |pkg|
# package pkg do
#   action :install
#   end
# end
