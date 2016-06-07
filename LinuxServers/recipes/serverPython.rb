#
# Cookbook Name:: LinuxServers
# Recipe:: default
#
# Copyright (c) 2016 Bill Stokes, All Rights Reserved.

include_recipe "LinuxServers::serverAws"
include_recipe "LinuxServers::serviceUwsgi"

include_recipe 'memcached::default'
include_recipe 'poise-python::default'
include_recipe 'build-essential::default'


# necessary supporting packages (wheezy)
%w{gettext libgmp-dev}.each do |pkg|
package pkg do
  action :install
  end
end
