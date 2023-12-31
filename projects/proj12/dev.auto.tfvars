node_role                         = "sitadinfra-eksNodeRole-dev"
caller_user_id                    = "kehindegb"
cluster_admin                     = "sitadinfra-eksClusterAdmin"
vpc_cidr                          = "10.0.0.0/16"
az_1a_public_cidr                 = "10.0.32.0/19"
az_1b_public_cidr                 = "10.0.64.0/19"
az_1a_private_cidr                = "10.0.96.0/20"
az_1b_private_cidr                = "10.0.112.0/20"
public_az_1a                      = "us-east-1a"
public_az_1b                      = "us-east-1b"
private_az_1a                     = "us-east-1a"
private_az_1b                     = "us-east-1b"
cluster_name                      = "sitadinfra-eks_cluster-DEV"
public_access_cidrs               = ["86.129.220.80/32",]
cluster_iam_role_name             = "sitadinfra-eksClusterRole-dev"
node_group_public_key             = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCoQmECTY2dWObkmLPIulRMIlhev2CdssrTTTiYZNj46O3DDL9BVZNg9uzPxzZDZgXV2cvJokyvOCYIyQqIDDVK8Qv5JObaF2plbIg0JY/nJz86dv7u3FpSWS5AcEPJCfYsv2XSf6Ywra/oe/AkMucqpCUhOW+DIIwMVN/ZFpIfxjyMXjO0c4Di3+JexXpIkLzhAIp7e4zJn6mNQuXa+1a+/jzhQAXYeVPDNVbGoA10d8deUOYDgZxhwMHwyRI6VURvB4trUY3jLhYdyjqm7f8eClOJS53vvBFGs/PiWqcWhwireDT6czpbNQGjmLGo4EzK7K4Z4WQvPG4v1TTmMZDuYgRSn/pET8fBUgXPxsvA9M+YTq20l2izFtbH6Sb0wUToNXq9S8B3txU4BqI4qGZx8zDZCLO5hHtkshG92NZZFfNAPkfGEDr1OnOAsfZxop5zGO6oLAv8MfRPbUBZ7nhk3r675+C4k4YNNG+qlZVk/w/+0HZGYC047J/vHyaAQSs="
node_group_iam_role                     = "sitadinfra-eksNodeRole-dev"
aws_lb_controller_iam_role_name         = "sitadinfra-AmazonEKSLoadBalancerControllerRole"
awslbc_iam_policy_name                  = "sitadinfra-AWSLBC_IamPolicy"
ebs_csi_driver_iam_role_name            = "sitadinfra-AmazonEKS_EBS_CSI_DriverRole"
eks_cluster_admin_user                  = "sitadinfra-eksClusterAdmin"
eks_admin_user_policy_name              = "sitadinfra-eksClusterAdminPolicy"
nginx_db_secret_iam_role_name           = "sitadinfra-nginxDBSecretIAMRole"
nginx_db_secret_iam_policy_name         = "sitadinfra-NginxDBSecretIAMPolicy"
awspca_iam_role_name                    = "sitadinfra-awspcaIAMRole"
awspca_iam_policy_name                  = "sitadinfra-awspcaIAMPolicy"
awsgatewayapi_iam_role_name             = "sitadinfra-awsgatewayapiIAMRole"
awsgatewayapi_iam_policy_name           = "sitadinfra-awsgatewayapiIAMPolicy"
acm_certificate_domain_name             = "www.sitadconsulting.com"
