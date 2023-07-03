##########################
# VPC Resources outputs
##########################
output "vpc_id" {
  description = "The ID of the VPC"
  value       = { for k in sort(keys(local.vpc_props)) : k => module.vpc[k].vpc_id }
}
output "vpc_dhcp_options_id" {
  description = "The ID of this DHCP_OPTIONS set"
  value       = { for k in sort(keys(local.dhcp_options_props)) : k => module.vpc_dhcp_options[k].vpc_dhcp_options_id }
}
output "vpc_enable_dns_support" {
  description = "The state of DNS Support for this VPC"
  value       = { for k in sort(keys(local.vpc_props)) : k => module.vpc[k].vpc_enable_dns_support }
}
output "vpc_enable_dns_hostnames" {
  description = "The state of DNS Hostname for this VPC"
  value       = { for k in sort(keys(local.vpc_props)) : k => module.vpc[k].vpc_enable_dns_hostnames }
}
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway device"
  value       = { for k in sort(keys(local.igw_props)) : k => module.internet_gateway[k].internet_gateway_id }
}
output "eip_id" {
  description = "The EIP allocation ID"
  value       = { for k in sort(keys(local.eip_props)) : k => module.eip[k].eip_id }
}
output "eip_public_dns" {
  description = "The public dns name associated with this EIP"
  value       = { for k in sort(keys(local.eip_props)) : k => module.eip[k].eip_public_dns }
}
output "eip_public_ip" {
  description = "The public ip assigned to this EIP"
  value       = { for k in sort(keys(local.eip_props)) : k => module.eip[k].eip_public_ip }
}
output "public_subnet_id" {
  description = "List of IDs for public subnets"
  value       = { for k in sort(keys(local.vpc_public_subnet_props)) : k => module.public_subnet[k].public_subnet_id }
}
output "private_subnet_id" {
  description = "List of IDs for private subnets"
  value       = { for k in sort(keys(local.vpc_private_subnet_props)) : k => module.private_subnet[k].private_subnet_id }
}
output "nat_gateway_id" {
  description = "The ID of the NAT gateway device"
  value       = { for k in sort(keys(local.ngw_props)) : k => module.nat_gateway[k].nat_gateway_id }
}
output "nat_gateway_public_ip" {
  description = "The public ip of the NAT gateway device"
  value       = { for k in sort(keys(local.ngw_props)) : k => module.nat_gateway[k].nat_gateway_public_ip }
}
output "public_route_table_id" {
  description = "ID of public route table"
  value       = { for k in sort(keys(local.route_table_props)) : k => module.public_route_table[k].public_route_table_id }
}
output "private_route_table_id" {
  description = "ID of private route table"
  value       = { for k in sort(keys(local.route_table_props)) : k => module.private_route_table[k].private_route_table_id }
}
output "public_route_table_association_id" {
  description = "List of public route table association ids"
  value       = { for k in sort(keys(local.route_table_assoc_props)) : k => module.public_route_table_association[k].public_route_table_association_id }
}
output "private_route_table_association_id" {
  description = "List of private route table association ids"
  value       = { for k in sort(keys(local.route_table_assoc_props)) : k => module.private_route_table_association[k].private_route_table_association_id }
}
output "internet_gateway_route_id" {
  description = "The route ID of the Internet Gateway device"
  value       = { for k in sort(keys(local.route_props)) : k => module.internet_gateway_route[k].internet_gateway_route_id }
}
output "nat_gateway_route_id" {
  description = "The route ID of the NAT Gateway device"
  value       = { for k in sort(keys(local.route_props)) : k => module.nat_gateway_route[k].nat_gateway_route_id }
}
#########################
# EKS iam user outputs
#########################
output "iam_user_name" {
  description = "The user's name"
  value       = [ for k in sort(keys(local.eks_iam_user_props)) :  module.iam_user[k].iam_user_name ]
}
output "iam_user_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = [ for k in sort(keys(local.eks_iam_user_props)) :  module.iam_user[k].iam_user_arn ]
}
##########################
# EKS iam policy outputs
##########################
output "iam_policy_policy" {
  description = "The user policy arn"
  value       = [ for k in sort(keys(local.eks_iam_user_policy_props)) :  module.iam_user_policy[k].iam_policy_arn ]
}
###############################
# EKS cluster iam role outputs
###############################
output "eks_cluster_iam_role_name" {
  description = "The name of this cluster iam role."
  value       = [ for k in sort(keys(local.eks_cluster_iam_role_props)) :  module.eks_cluster_iam_role[k].iam_role_name ]
}
output "eks_cluster_iam_role_arn" {
  description = "The ARN of this cluster iam role."
  value       = [ for k in sort(keys(local.eks_cluster_iam_role_props)) :  module.eks_cluster_iam_role[k].iam_role_arn ]
}
###############################################
# EKS Loadbalancer controller Iam role outputs
###############################################
output "eks_lb_controller_iam_role_name" {
  description = "The name of this loadbalancer controller iam role"
  value       = [ for k in sort(keys(local.eks_lb_controller_iam_role_props)) :  module.eks_lb_controller_iam_role[k].iam_role_name ]
}
output "eks_lb_controller_iam_role_arn" {
  description = "The ARN of this loadbalancer controller iam role"
  value       = [ for k in sort(keys(local.eks_lb_controller_iam_role_props)) :  module.eks_lb_controller_iam_role[k].iam_role_arn ]
}
#################################################
# EKS Loadbalancer controller Iam policy outputs
#################################################
output "eks_lb_controller_iam_policy" {
  description = "The arn of this loadbalancer controller policy"
  value       = { for k in sort(keys(local.eks_lb_controller_iam_policy_props)) : k => module.eks_lb_controller_iam_policy[k].iam_policy_arn }
}
######################################
# EKS EBS CSI Driver Iam role outputs
######################################
output "eks_ebs_csi_driver_iam_role_name" {
  description = "The name of this EBS CSI Driver iam role."
  value       = [ for k in sort(keys(local.eks_ebs_csi_driver_iam_role_props)) :  module.eks_ebs_csi_driver_iam_role[k].iam_role_name ]
}
output "eks_ebs_csi_driver_iam_role_arn" {
  description = "The ARN of this EBS CSI Driver iam role."
  value       = [ for k in sort(keys(local.eks_ebs_csi_driver_iam_role_props)) :  module.eks_ebs_csi_driver_iam_role[k].iam_role_arn ]
}
#######################
# EKS cluster outputs
#######################
output "eks_cluster_id" {
  description = "cluster id"
  value       = [ for k in sort(keys(local.eks_cluster_props)) :  module.eks_cluster[k].eks_cluster_id ]
}
output "eks_cluster_name" {
  description = "cluster name"
  value       = [ for k in sort(keys(local.eks_cluster_props)) :  module.eks_cluster[k].eks_cluster_name ]
}
output "eks_cluster_arn" {
  description = "cluster arn"
  value       = [ for k in sort(keys(local.eks_cluster_props)) :  module.eks_cluster[k].eks_cluster_arn ]
}
output "eks_cluster_certificate_authority" {
  description = "cluster certificate authority data"
  value       = [ for k in sort(keys(local.eks_cluster_props)) :  module.eks_cluster[k].eks_cluster_certificate_authority ]
}
output "eks_cluster_endpoint" {
  description = "cluster endpoint"
  value       = [ for k in sort(keys(local.eks_cluster_props)) :  module.eks_cluster[k].eks_cluster_endpoint ]
}
output "eks_cluster_status" {
  description = "cluster status"
  value       = [ for k in sort(keys(local.eks_cluster_props)) :  module.eks_cluster[k].eks_cluster_status ]
}
output "eks_cluster_platform_version" {
  description = "cluster platform version"
  value       = [ for k in sort(keys(local.eks_cluster_props)) :  module.eks_cluster[k].eks_cluster_platform_version ]
}
output "eks_cluster_identity" {
  description = "cluster identity provider information"
  value       = [ for k in sort(keys(local.eks_cluster_props)) :  module.eks_cluster[k].eks_cluster_identity ]
}
output "eks_cluster_vpc_config" {
  description = "cluster VPC configuration information"
  value       = [ for k in sort(keys(local.eks_cluster_props)) :  module.eks_cluster[k].eks_cluster_vpc_config ]
}
output "eks_cluster_security_group_id" {
  description = "cluster security group id"
  value       = [ for k in sort(keys(local.eks_cluster_props)) :  module.eks_cluster[k].eks_cluster_security_group_id ]
}
output "eks_cluster_issuer_url" {
  description = "The issuer URL for the OIDC identity provider"
  value       = [ for k in sort(keys(local.eks_cluster_props)) :  module.eks_cluster[k].eks_cluster_issuer_url ] 
}
###################################
# EKS Node Group  iam role outputs
###################################
output "eks_node_group_iam_role_name" {
  description = "The name of this EKS Node Group iam role."
  value       = [ for k in sort(keys(local.eks_node_group_iam_role_props)) :  module.eks_node_group_iam_role[k].iam_role_name ]
}
output "eks_node_group_iam_role_arn" {
  description = "The ARN of this EKS Node Group iam role."
  value       = [ for k in sort(keys(local.eks_node_group_iam_role_props)) :  module.eks_node_group_iam_role[k].iam_role_arn ]
}
###############################
# Iam instance profile outputs
###############################
output "iam_instance_profile_id" {
  description = "The ID for this instance profile"
  value       = [ for k in sort(keys(local.iam_instance_profile_props)) :  module.iam_instance_profile[k].iam_instance_profile_id ]
}
output "iam_instance_profile_arn" {
  description = "The ARN for this instance profile"
  value       = [ for k in sort(keys(local.iam_instance_profile_props)) :  module.iam_instance_profile[k].iam_instance_profile_arn ]
}
###########################
# Launch Template outputs
###########################
output "launch_template_id" {
  description = "ID of this launch template"
  value       = [ for k in sort(keys(local.launch_template_props)) :  module.launch_template[k].launch_template_id ]
}
output "launch_template_arn" {
  description = "ARN of this launch template"
  value       = [ for k in sort(keys(local.launch_template_props)) :  module.launch_template[k].launch_template_arn ]
}
output "launch_template_latest_version" {
  description = "The latest version of the launch template"
  value       = [ for k in sort(keys(local.launch_template_props)) :  module.launch_template[k].launch_template_latest_version ]
}
###################
# Key pair outputs
###################
output "key_pair_id" {
  description = "ID of the created key pair"
  value       = [ for k in sort(keys(local.key_pair_props)) :  module.key_pair[k].key_pair_id ]
}
output "key_pair_arn" {
  description = "ARN of the created key pair"
  value       = [ for k in sort(keys(local.key_pair_props)) :  module.key_pair[k].key_pair_arn ]
}
output "key_pair_name" {
  description = "Name of the created key pair"
  value       = [ for k in sort(keys(local.key_pair_props)) :  module.key_pair[k].key_pair_name ]
}
##########################
# Security Group outputs
##########################
output "security_group_id" {
  description = "The ID of this security group"
  value       = [ for k in sort(keys(local.security_group_props)) :  module.security_group[k].security_group_id ]
}
output "security_group_arn" {
  description = "The ARNs of this security group"
  value       = [ for k in sort(keys(local.security_group_props)) :  module.security_group[k].security_group_arn ]
}
#############################
# Autoscaling group outputs
#############################
output "autoscaling_group_id" {
  description = "Auto Scaling Group id"
  value       = [ for k in sort(keys(local.autoscaling_group_props)) :  module.autoscaling_group[k].autoscaling_group_id ]
}
output "autoscaling_group_arn" {
  description = "ARN of this autoscaling group"
  value       = [ for k in sort(keys(local.autoscaling_group_props)) :  module.autoscaling_group[k].autoscaling_group_arn ]
}
output "autoscaling_group_availability_zones" {
  description = "Availability zones of the Auto Scaling Group"
  value       = [ for k in sort(keys(local.autoscaling_group_props)) :  module.autoscaling_group[k].autoscaling_group_availability_zones ]
}
output "autoscaling_group_min_size" {
  description = "Minimum size of the Auto Scaling Group"
  value       = [ for k in sort(keys(local.autoscaling_group_props)) :  module.autoscaling_group[k].autoscaling_group_min_size ]
}
output "autoscaling_group_max_size" {
  description = "Maximum size of the Auto Scaling Group"
  value       = [ for k in sort(keys(local.autoscaling_group_props)) :  module.autoscaling_group[k].autoscaling_group_max_size ]
}
output "autoscaling_group_default_instance_warmup" {
  description = "The duration of the default instance warmup, in seconds"
  value       = [ for k in sort(keys(local.autoscaling_group_props)) :  module.autoscaling_group[k].autoscaling_group_default_instance_warmup ]
}
output "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  value       = [ for k in sort(keys(local.autoscaling_group_props)) :  module.autoscaling_group[k].autoscaling_group_name ]
}
output "autoscaling_group_health_check_grace_period" {
  description = "Time after instance comes into service before checking health"
  value       = [ for k in sort(keys(local.autoscaling_group_props)) :  module.autoscaling_group[k].autoscaling_group_health_check_grace_period ]
}
output "autoscaling_group_health_check_type" {
  description = "EC2 or ELB. Controls how health checking is done"
  value       = [ for k in sort(keys(local.autoscaling_group_props)) :  module.autoscaling_group[k].autoscaling_group_health_check_type ]
}
output "autoscaling_group_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  value       = [ for k in sort(keys(local.autoscaling_group_props)) :  module.autoscaling_group[k].autoscaling_group_desired_capacity ]
}
output "autoscaling_group_vpc_zone_identifier" {
  description = "The VPC zone identifier"
  value       = [ for k in sort(keys(local.autoscaling_group_props)) :  module.autoscaling_group[k].autoscaling_group_vpc_zone_identifier ]
}
##########################
# iam access key outputs
##########################
output "iam_access_key_id" {
  description = "Access key ID"
  value       = [ for k in sort(keys(local.iam_access_key_props)) :  module.iam_access_key[k].iam_access_key_id ]
}
output "iam_access_key_secret" {
  description = "Secret access key"
  value       = [ for k in sort(keys(local.iam_access_key_props)) :  module.iam_access_key[k].iam_access_key_secret ]
  sensitive   = true
}
output "iam_access_key_encrypted_secret" {
  description = "Encrypted secret, base64 encoded, if pgp_key was specified"
  value       = [ for k in sort(keys(local.iam_access_key_props)) :  module.iam_access_key[k].iam_access_key_encrypted_secret ]
}
##################################
# iam user login profile  outputs
##################################
output "iam_user_login_profile_password" {
  description = "The plain text password, only available when pgp_key is not provided"
  value       = [ for k in sort(keys(local.iam_user_login_profile_props)) :  module.iam_user_login_profile[k].iam_user_login_profile_password ]
}
output "iam_user_login_profile_encrypted_password" {
  description = "The encrypted password, base64 encoded. Only available if password was handled on Terraform resource creation, not import"
  value       = [ for k in sort(keys(local.iam_user_login_profile_props)) :  module.iam_user_login_profile[k].iam_user_login_profile_encrypted_password ]
}
######################
#   nginx db secret
######################
output "nginx_db_secret_arn" {
  description = "Nginx db secret ARN"
  value       = [ for k in sort(keys(local.nginx_db_secret_props)) : module.secretsmanager_secret[k].secret_arn ]
}
###################################
# nginx db secret IAM Role outputs
###################################
output "nginx_db_secret_iam_role_name" {
  description = "The name of this nginx_db_secret iam role."
  value       = [ for k in sort(keys(local.nginx_db_secret_iam_role_props)) :  module.nginx_db_secret_iam_role[k].iam_role_name ]
}
output "nginx_db_secret_iam_role_arn" {
  description = "The ARN of this nginx_db_secret iam role."
  value       = [ for k in sort(keys(local.nginx_db_secret_iam_role_props)) :  module.nginx_db_secret_iam_role[k].iam_role_arn ]
}
##########################
# AWSPCA IAM Role outputs
##########################
output "awspca_iam_role_name" {
  description = "awspca iam role"
  value       = [ for k in sort(keys(local.awspca_iam_role_props)) :  module.awspca_iam_role[k].iam_role_name ]
}
output "awspca_iam_role_arn" {
  description = "ARN of awspca iam role"
  value       = [ for k in sort(keys(local.awspca_iam_role_props)) :  module.awspca_iam_role[k].iam_role_arn ]
}
#################################
# AWSGATEWAYAPI IAM Role outputs
#################################
output "awsgatewayapi_iam_role_name" {
  description = "awsgatewayapi iam role name"
  value       = [ for k in sort(keys(local.awsgatewayapi_iam_role_props)) :  module.awsgatewayapi_iam_role[k].iam_role_name ]
}
output "awsgatewayapi_iam_role_arn" {
  description = "ARN of awsgatewayapi iam role"
  value       = [ for k in sort(keys(local.awsgatewayapi_iam_role_props)) :  module.awsgatewayapi_iam_role[k].iam_role_arn ]
}
#############################
# ACMPCA Certificate outputs
#############################
output "acmpca_certificate_arn" {
  description = "ARN of this acmpca certificate"
  value       = { for k in sort(keys(local.acmpca_certificate_props)) : k => module.acmpca_certificate[k].acmpca_certificate_arn }
}
output "acmpca_certificate" {
  description = "PEM-encoded certificate value"
  value       = { for k in sort(keys(local.acmpca_certificate_props)) : k => module.acmpca_certificate[k].acmpca_certificate }
}
output "acmpca_certificate_chain" {
  description = "PEM-encoded certificate chain that includes any intermediate certificates and chains up to root CA"
  value       = { for k in sort(keys(local.acmpca_certificate_props)) : k => module.acmpca_certificate[k].acmpca_certificate_chain }
}
#######################################
# ACMPCA Certificate Authority outputs
#######################################
output "acmpca_ca_arn" {
  description = "ARN of this acmpca certificate authority"
  value       = { for k in sort(keys(local.acmpca_ca_props)) : k => module.acmpca_ca[k].acmpca_ca_arn }
}
output "acmpca_ca_id" {
  description = "ID of this acmpca certificate authority"
  value       = { for k in sort(keys(local.acmpca_ca_props)) : k => module.acmpca_ca[k].acmpca_ca_id }
}
output "acmpca_ca_certificate" {
  description = "Base64-encoded certificate authority (CA) certificate. Only available after the certificate authority certificate has been imported"
  value       = { for k in sort(keys(local.acmpca_ca_props)) : k => module.acmpca_ca[k].acmpca_ca_certificate }
}
output "acmpca_ca_certificate_chain" {
  description = "Base64-encoded certificate chain that includes any intermediate certificates and chains up to root on-premises certificate that you used to sign your private CA certificate. The chain does not include your private CA certificate. Only available after the certificate authority certificate has been imported"
  value       = { for k in sort(keys(local.acmpca_ca_props)) : k => module.acmpca_ca[k].acmpca_ca_certificate_chain }
}
output "acmpca_ca_certificate_signing_request" {
  description = "The base64 PEM-encoded certificate signing request (CSR) for your private CA certificate"
  value       = { for k in sort(keys(local.acmpca_ca_props)) : k => module.acmpca_ca[k].acmpca_ca_certificate_signing_request }
}
output "acmpca_ca_not_after" {
  description = "Date and time after which the certificate authority is not valid. Only available after the certificate authority certificate has been imported"
  value       = { for k in sort(keys(local.acmpca_ca_props)) : k => module.acmpca_ca[k].acmpca_ca_not_after }
}
output "acmpca_ca_not_before" {
  description = "Date and time before which the certificate authority is not valid. Only available after the certificate authority certificate has been imported"
  value       = { for k in sort(keys(local.acmpca_ca_props)) : k => module.acmpca_ca[k].acmpca_ca_not_before }
}
output "acmpca_ca_serial" {
  description = "Serial number of the certificate authority. Only available after the certificate authority certificate has been imported"
  value       = { for k in sort(keys(local.acmpca_ca_props)) : k => module.acmpca_ca[k].acmpca_ca_serial }
}
output "acmpca_ca_enabled" {
  description = "Status of the certificate authority"
  value       = { for k in sort(keys(local.acmpca_ca_props)) : k => module.acmpca_ca[k].acmpca_ca_enabled }
}
#####################################################################
# Helm Release outputs
# Please uncomment as part of Terraform Fourth Plan and Apply Cycle
#####################################################################
#output "release_manifest" {
#  description = "The rendered manifest of the release as JSON"
#  value       = { for k in sort(keys(local.helm_package_props)) : k => module.helm_release[k].release_manifest }
#}
#output "release_metadata" {
#  description = "Status of the deployed release"
#  value       = { for k in sort(keys(local.helm_package_props)) : k => module.helm_release[k].release_metadata }
#}
#output "release_status" {
#  description = "Status of the release"
#  value       = { for k in sort(keys(local.helm_package_props)) : k => module.helm_release[k].release_status }
#}
#############################
# kubernetes objects outputs
#############################
#output "ingress_lb_hostname" {
#  description = "Hostname of this ingress resource"
#  value       = [ for k in sort(keys(local.kube_ingress_props)) :  module.kubernetes_ingress[k].ingress_lb_hostname ]
#}
#output "ingress_lb_ip" {
#  description = "IP of this ingress resource"
#  value       = [ for k in sort(keys(local.kube_ingress_props)) :  module.kubernetes_ingress[k].ingress_lb_ip ]
#}
########################
# Route53 zone outputs
########################
#output "route53_zone_arn" {
#  description = "The Amazon Resource Name (ARN) of the Hosted Zone"
#  value       = { for k in sort(keys(local.route53_zone_props)) : k => module.route53_zone[k].route53_zone_arn }
#}
#output "route53_zone_id" {
#  description = "The Hosted Zone ID"
#  value       = { for k in sort(keys(local.route53_zone_props)) : k => module.route53_zone[k].route53_zone_id }
#}
#output "route53_zone_name_servers" {
#  description = "A list of name servers in associated (or default) delegation set"
#  value       = { for k in sort(keys(local.route53_zone_props)) : k => module.route53_zone[k].route53_zone_name_servers }
#}
#output "route53_zone_primary_name_server" {
#  description = "The Route 53 name server that created the SOA record"
#  value       = { for k in sort(keys(local.route53_zone_props)) : k => module.route53_zone[k].route53_zone_primary_name_server }
#}
#########################
# Route53 record outputs
#########################
#output "route53_record_name" {
#  description = "The name of the record"
#  value       = { for k in sort(keys(local.route53_record_props)) : k => module.route53_record[k].route53_record_name }
#}
#output "route53_record_fqdn" {
#  description = "FQDN built using the zone domain and name"
#  value       = { for k in sort(keys(local.route53_record_props)) : k => module.route53_record[k].route53_record_fqdn }
#}
##########################
# ACM Certificate outputs
##########################
#output "acm_arn" {
#  description = "ARN of this acm certificate"
#  value       = { for k in sort(keys(local.acm_certificate_props)) : k => module.acm_certificate[k].acm_arn }
#}
#output "acm_id" {
#  description = "ARN of this acm certificate"
#  value       = { for k in sort(keys(local.acm_certificate_props)) : k => module.acm_certificate[k].acm_id }
#}
#output "acm_domain_name" {
#  description = "Domain name for which the certificate is issued"
#  value       = { for k in sort(keys(local.acm_certificate_props)) : k => module.acm_certificate[k].acm_domain_name }
#}
#output "acm_domain_validation_options" {
#  description = "Set of domain validation objects which can be used to complete certificate validation. Can have more than one element, e.g., if SANs are defined"
#  value       = { for k in sort(keys(local.acm_certificate_props)) : k => module.acm_certificate[k].acm_domain_validation_options }
#}
#output "acm_pending_renewal" {
#  description = "true if a Private certificate eligible for managed renewal is within the early_renewal_duration period"
#  value       = { for k in sort(keys(local.acm_certificate_props)) : k => module.acm_certificate[k].acm_pending_renewal }
#}
#output "acm_not_after" {
#  description = "Expiration date and time of the certificate"
#  value       = { for k in sort(keys(local.acm_certificate_props)) : k => module.acm_certificate[k].acm_not_after }
#}
#output "acm_not_before" {
#  description = "Start of the validity period of the certificate"
#  value       = { for k in sort(keys(local.acm_certificate_props)) : k => module.acm_certificate[k].acm_not_before }
#}
#output "acm_renewal_eligibility" {
#  description = "Whether the certificate is eligible for managed renewal"
#  value       = { for k in sort(keys(local.acm_certificate_props)) : k => module.acm_certificate[k].acm_renewal_eligibility }
#}
#output "acm_renewal_summary" {
#  description = "Contains information about the status of ACM's managed renewal for the certificate"
#  value       = { for k in sort(keys(local.acm_certificate_props)) : k => module.acm_certificate[k].acm_renewal_summary }
#}
#output "acm_status" {
#  description = "Status of the certificate"
#  value       = { for k in sort(keys(local.acm_certificate_props)) : k => module.acm_certificate[k].acm_status }
#}
#output "acm_type" {
#  description = "Source of the certificate"
#  value       = { for k in sort(keys(local.acm_certificate_props)) : k => module.acm_certificate[k].acm_type }
#}
#output "acm_validation_emails" {
#  description = "List of addresses that received a validation email. Only set if EMAIL validation was used"
#  value       = { for k in sort(keys(local.acm_certificate_props)) : k => module.acm_certificate[k].acm_validation_emails }
#}
