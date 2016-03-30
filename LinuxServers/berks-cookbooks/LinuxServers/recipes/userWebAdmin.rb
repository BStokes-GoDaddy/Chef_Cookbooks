#
# Cookbook Name:: LinuxServers
# Recipe:: userWebAdmin
#
# Copyright (c) 2016 Bill Stokes, All Rights Reserved.
group node['LinuxServers']['userWebAdmin']['group']

user node['LinuxServers']['userWebAdmin']['user'] do
  group node['LinuxServers']['userWebAdmin']['group']
  system true
  shell '/bin/bash'
end
