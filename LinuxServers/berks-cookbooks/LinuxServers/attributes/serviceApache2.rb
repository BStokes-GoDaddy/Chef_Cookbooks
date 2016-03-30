
# Apache2
default['apache']['ServerName']     = node['hostname']
default['apache']['contact']        = "webadmin@#{node['hostname']}.org"
default['apache']['user']           = 'www-data'
default['apache']['group']          = 'www-data'
default['apache']['timeout']        = 300
default['apache']['listenports']    = [80, 443]
default['apache']['listen']         = ["*:80", "*:443"]
default['apache']['document_root']  = '/var/www'

default['LinuxServers']['pkgApache2']['document_root']  = '/var/www/public_html'
default['LinuxServers']['pkgApache2']['user']           = 'www-data'
default['LinuxServers']['pkgApache2']['group']          = 'www-data'
