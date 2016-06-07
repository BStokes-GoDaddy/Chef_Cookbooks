#
# Cookbook Name:: LinuxServers
# Recipe:: default
#
# Copyright (c) 2016 Bill Stokes, All Rights Reserved.

include_recipe "LinuxServers::serverAws"

include_recipe 'firewall::default'
include_recipe 'memcached::default'

include_recipe 'LinuxServers::userWebAdmin'
include_recipe 'LinuxServers::serviceApache2'


# necessary supporting packages (wheezy)
%w{zlib1g-dev libssl-dev libbz2-dev gettext libgmp-dev}.each do |pkg|
package pkg do
  action :install
  end
end

firewall_rule 'http/https' do
  position 1
  protocol :tcp
  port     [80, 443]
  command   :allow
end

firewall_rule 'ssh' do
  port     22
  command  :allow
end
