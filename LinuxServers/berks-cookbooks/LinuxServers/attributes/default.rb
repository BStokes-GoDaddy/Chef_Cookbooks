
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

# Python
default['python']['version'] = '2.7.7'
