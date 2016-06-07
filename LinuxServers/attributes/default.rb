
#  apt
default['apt']['unattended_upgrades']['enable']                 = true
default['apt']['unattended_upgrades']['update_package_lists']   = true

# auto-patch
default['auto-patch']['monthly']    = nil
default['auto-patch']['weekly']     = 'monday'
default['auto-patch']['hour']       = 3
default['auto-patch']['minute']     = 0
default['auto-patch']['reboot']     = true

# Firewall
default['firewall']['allow_ssh']                    = true
default['LinuxServers']['firewwall']['open_ports']  = [80, 443]

# openssl
openssl_version = '1.0.2h'
default['openssl_source']['openssl']['version'] = openssl_version
default['openssl_source']['openssl']['prefix']  = "/opt/openssl-#{openssl_version}"
default['openssl_source']['openssl']['url'] = "https://www.openssl.org/source/openssl-#{openssl_version}.tar.gz"
default['openssl_source']['openssl']['checksum'] = '1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919'

# Python
default['poise-python']['version'] = '2'
default['poise-python']['pip_version'] = true
default['poise-python']['setuptools_version'] = true
default['poise-python']['virtualenv_version'] = true
