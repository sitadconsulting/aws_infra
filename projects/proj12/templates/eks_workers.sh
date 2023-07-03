Content-Type: multipart/mixed; boundary="==MYBOUNDARY=="

MIME-Version: 1.0

--==MYBOUNDARY==
Content-Type: text/x-shellscript; charset="us-ascii"

#!/bin/bash -xe

yum -y update

/etc/eks/bootstrap.sh --b64-cluster-ca "${cluster_auth_base64}" --apiserver-endpoint "${endpoint}" "${cluster_name}" --container-runtime containerd
#/etc/eks/bootstrap.sh --b64-cluster-ca "${cluster_auth_base64}" --apiserver-endpoint "${endpoint}" "${cluster_name}" 

cd /tmp
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent

--==MYBOUNDARY==--\
