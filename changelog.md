# Chef_Cookbooks

BASH Commands to create Chef Deployment package
-----

berks install
berks package Chef_LinuxServers.tar.gz
aws s3 cp Chef_LinuxServers.tar.gz s3://digitized.sanctuary.code.deploy



<!--
  AWS OpsWorks
  http://docs.aws.amazon.com/opsworks/latest/userguide/cli-examples.html
  http://docs.aws.amazon.com/cli/latest/reference/opsworks/index.html
-->

sId="bcb14c5b-b2cb-46d0-90d1-6dc23431d633"
sId
dId=aws opsworks --region us-east-1 create-deployment --stack-id $sId  --command '{"Name": "update_custom_cookbooks"}' --query 'DeploymentId'

aws opsworks --region us-east-1 wait deployment-successful --deployment-id $dId

"DeploymentId": "baf30d8a-df8c-4e19-81ce-87f91c644d1d"


---s3
