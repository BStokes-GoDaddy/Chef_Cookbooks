#
# Cookbook Name:: LinuxServers
# Recipe:: opwDsRapDev
#
# Copyright (c) 2016 Bill Stokes, All Rights Reserved.

app       = search("aws_opsworks_app", "name:" + app['environment']['OPSAPPNAME']).first
appPath   = app['environment']['DIGIDEST']
appEnv    = app['environment']['DIGIENV']
appGroup  = app['environment']['DIGIGROUP']
pyEnv     = "env27"


Chef::Log.info("********** opwDsRapDev **********")
Chef::Log.info("** The app's short name is '#{app['shortname']}' **")
Chef::Log.info("** The app's URL is '#{app['app_source']['url']}' **")
Chef::Log.info("** The app's path is '#{app['environment']['DIGIDEST']}' **")


file '/etc/profile.d/DigitizedSanctuary.sh' do
  content   "export DIGIDEST=" + appPath + "\n" +
            "export DIGIENV=" + appEnv + "\n" +
            "export DIGIGROUP=" + appGroup + "\n"
  mode      '0755'
  owner     'root'
  group     'root'
  notifies  :enable, 'application[' + appPath + ']', :immediately
  action    :create
end


application appPath do
  owner 'www-data'
  group 'www-data'

  python node.default['poise-python']['version']
  python_runtime node.default['poise-python']['version']

  virtualenv appPath +  "/" + pyEnv do
    path  appPath +  "/" + pyEnv
  end

  # Get the code
  # git appPath do
  #   repository  app['app_source']['url']
  #   revision    app['app_source']['revision']
  #   deploy_key  app['app_source']['ssh_key']
  # end

  # Install all the requirements
  # %w{requirements_dev.txt requirements_prod.txt}.each do |reqFile|
  #   pip_requirements reqFile do
  #     virtualenv appPath +  "/" + pyEnv
  #   end
  # end

  # notifies :run, 'execute[makeConfigDev]', :delayed
end


# run the make files upon notification
# execute 'makeConfigDev' do
#   command   'make config-dev'
#   cwd       appPath
#   action    :nothing
#   notifies  :run, 'execute[makeApache2]', :immediately
# end


# execute 'makeApache2' do
#   command   'make apache2'
#   cwd       appPath
#   action    :nothing
# end
