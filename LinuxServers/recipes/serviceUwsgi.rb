#
# Cookbook Name:: LinuxServers
# Recipe:: serviceUwsgi.rb
#
# Copyright (c) 2016 Bill Stokes, All Rights Reserved.
# uWSGI installation
include_recipe 'uwsgi::default'
include_recipe 'memcached::default'


# uWSGI supporting packages
%w{uwsgi uwsgi-plugin-python uwsgi-plugin-alarm-curl}.each do |pkg|
package pkg do
  action :install
  end
end


execute 'uwsgitop-installation' do
  command     'pip install -U --force-reinstall uwsgitop'
  user        'root'
  action      :run
end
