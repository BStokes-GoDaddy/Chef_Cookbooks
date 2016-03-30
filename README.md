# Chef_Cookbooks

BASH Commands to create Chef Deployment package
-----

berks install
berks package Chef_LinuxServers.tar.gz
sudo rm -rf apache2
aws s3 cp Chef_LinuxServers.tar.gz s3://digitized.sanctuary.code.deploy
