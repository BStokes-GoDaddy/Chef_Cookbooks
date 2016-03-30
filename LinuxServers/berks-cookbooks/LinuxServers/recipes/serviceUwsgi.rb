#
# Cookbook Name:: LinuxServers
# Recipe:: serviceUwsgi.rb
#
# Copyright (c) 2016 Bill Stokes, All Rights Reserved.
# uWSGI installation
execute 'uwsgi-installation' do
  command     'sudo pip install -U uwsgi && sudo pip install -U uwsgitop'
  subscribes  :run, 'uwsgi', :immediate
  notifies    :run, 'execute[uwsgi-bin-alternative]', :immediate
  action      :nothing
end

# use the uwsgi installed by pip
execute 'uwsgi-bin-alternative' do
  command 'rm /etc/alternatives/uwsgi && ln -s /usr/local/bin/uwsgi /etc/alternatives/'
  action  :nothing
end
