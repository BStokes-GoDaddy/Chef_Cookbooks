#
# Cookbook Name:: LinuxServers
# Recipe:: default
#
# Copyright (c) 2016 Bill Stokes, All Rights Reserved.

include_recipe "LinuxServers::serverAws"
include_recipe "LinuxServers::serviceUwsgi"

include_recipe 'memcached::default'
include_recipe 'python::default'
include_recipe 'build-essential::default'
include_recipe 'uwsgi::default'


# necessary supporting packages (wheezy)
%w{zlib1g-dev libssl-dev libbz2-dev gettext libgmp-dev}.each do |pkg|
package pkg do
  action :install
  end
end
