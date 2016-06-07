#
# Cookbook Name:: LinuxServers
# Recipe:: opwDsRapDev
#
# Copyright (c) 2016 Bill Stokes, All Rights Reserved.

# AWS OpsWorks Data Bag Reference
# http://docs.aws.amazon.com/opsworks/latest/userguide/data-bags.html
# app                 = search("aws_opsworks_app", "name:" + app['environment']['OPSAPPNAME']).first
app                 = search("aws_opsworks_app", "deploy:true").first
instance            = search("aws_opsworks_instance").first
stack               = search("aws_opsworks_stack").first

appPath             = app['environment']['DIGIDEST']
appPathWebContent   = app['environment']['DIGIDEST'] + '/content'


Chef::Log.info("********** opwDsWebDev **********************************************************")
Chef::Log.info("** App:        '#{app['name']}' **")
Chef::Log.info("** Stack:      '#{stack['name']}' **")
Chef::Log.info("** Instance:   '#{instance['hostname']}' **")
Chef::Log.info("** App Source: '#{app['app_source']['url']}' **")
Chef::Log.info("*********************************************************************************")


file '/etc/profile.d/DigitizedSanctuary.sh' do
  content   "export DIGIDEST=" + appPath + "\n" +
            "export DIGIENV=" + app['environment']['DIGIENV'] + "\n" +
            "export DIGIGROUP=" + app['environment']['DIGIGROUP'] + "\n" +
            "export OPW_STACKNAME=" + stack['name'] + "\n" +
            "export OPW_APPNAME=" + app['name'] + "\n" +
            "export OPW_INSTANCENAME=" + instance['hostname'] + "\n" +
            "export OPW_ASGNAME=" + app['environment']['OPW_ASGNAME'] + "\n" +
            "export OPW_LAUNCHCONFIG=" + app['environment']['OPW_LAUNCHCONFIG'] + "\n" +
            "export OPW_SECURITYGROUP=" + app['environment']['OPW_SECURITYGROUP'] + "\n"
  mode      '0755'
  owner     'root'
  group     'root'
  notifies  :create, 'directory[' + appPathWebContent + ']', :immediately
  action    :create
end


directory appPathWebContent do
  recursive true
  action :nothing
  notifies :deploy, 'application[' + appPathWebContent +  ']', :immediately
end


application appPathWebContent do
  owner 'www-data'
  group 'www-data'

  # Get the code
  # git appPath do
  #   repository app['app_source']['url']
  #   revision app['app_source']['revision']
  # end
  #
  # notifies :run, 'execute[makeApache2]', :immediately
end


# run the make files upon notification
# execute 'makeApache2' do
#   command   '../make apache2'
#   cwd       appPath
#   action    :nothing
# end
