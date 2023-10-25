##########################
# VPC Resource outputs
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
output "public_subnet_1a_id" {
  description = "ID of public subnet 1a"
  value       = { for k in sort(keys(local.public_subnet_1a_props)) : k => module.public_subnet_1a[k].public_subnet_id }
}
output "public_subnet_1b_id" {
  description = "ID of public subnet 1b"
  value       = { for k in sort(keys(local.public_subnet_1b_props)) : k => module.public_subnet_1b[k].public_subnet_id }
}
output "public_subnet_1c_id" {
  description = "ID of public subnet 1c"
  value       = { for k in sort(keys(local.public_subnet_1c_props)) : k => module.public_subnet_1c[k].public_subnet_id }
}
output "private_subnet_1a_id" {
  description = "ID of private subnet 1a"
  value       = { for k in sort(keys(local.private_subnet_1a_props)) : k => module.private_subnet_1a[k].private_subnet_id }
}
output "private_subnet_1b_id" {
  description = "ID of private subnet 1b"
  value       = { for k in sort(keys(local.private_subnet_1b_props)) : k => module.private_subnet_1b[k].private_subnet_id }
}
output "private_subnet_1c_id" {
  description = "ID of private subnet 1c"
  value       = { for k in sort(keys(local.private_subnet_1c_props)) : k => module.private_subnet_1c[k].private_subnet_id }
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
  value       = { for k in sort(keys(local.public_route_table_props)) : k => module.public_route_table[k].public_route_table_id }
}
output "private_route_table_id" {
  description = "ID of private route table"
  value       = { for k in sort(keys(local.private_route_table_props)) : k => module.private_route_table[k].private_route_table_id }
}
output "public_route_table_association_id" {
  description = "List of public route table association ids"
  value       = { for k in sort(keys(local.public_route_table_assoc_props)) : k => module.public_route_table_association[k].public_route_table_association_id }
}
output "private_route_table_association_id" {
  description = "List of private route table association ids"
  value       = { for k in sort(keys(local.private_route_table_assoc_props)) : k => module.private_route_table_association[k].private_route_table_association_id }
}
output "internet_gateway_route_id" {
  description = "The route ID of the Internet Gateway device"
  value       = { for k in sort(keys(local.public_route_props)) : k => module.internet_gateway_route[k].internet_gateway_route_id }
}
output "nat_gateway_route_id" {
  description = "The route ID of the NAT Gateway device"
  value       = { for k in sort(keys(local.private_route_props)) : k => module.nat_gateway_route[k].nat_gateway_route_id }
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
###############################
# EC2 iam role outputs
###############################
output "ec2_iam_role_name" {
  description = "Iam role name"
  value       = [ for k in sort(keys(local.ec2_iam_role_props)) :  module.ec2_iam_role[k].iam_role_name ]
}
output "ec2_iam_role_arn" {
  description = "Iam role ARN"
  value       = [ for k in sort(keys(local.ec2_iam_role_props)) :  module.ec2_iam_role[k].iam_role_arn ]
}
###############################
# KDA iam role outputs
###############################
output "kda_iam_role_name" {
  description = "Iam role name"
  value       = [ for k in sort(keys(local.kda_iam_role_props)) :  module.kda_iam_role[k].iam_role_name ]
}
output "kda_iam_role_arn" {
  description = "Iam role ARN"
  value       = [ for k in sort(keys(local.kda_iam_role_props)) :  module.kda_iam_role[k].iam_role_arn ]
}
##################################
# Kafka connect  iam role outputs
##################################
output "kafka_connect_iam_role_name" {
  description = "Iam role name"
  value       = [ for k in sort(keys(local.kafka_connect_iam_role_props)) :  module.kafka_connect_iam_role[k].iam_role_name ]
}
output "kafka_connect_iam_role_arn" {
  description = "Iam role ARN"
  value       = [ for k in sort(keys(local.kafka_connect_iam_role_props)) :  module.kafka_connect_iam_role[k].iam_role_arn ]
}
#######################################
# Kafka connect Iam policy outputs
#######################################
output "kafka_connect_iam_policy" {
  description = "Kafka connect iam Policy ARN"
  value       = { for k in sort(keys(local.kafka_connect_iam_policy_props)) : k => module.kafka_connect_iam_policy[k].iam_policy_arn }
}
##########################################
# Kafka authorization Iam policy outputs
##########################################
output "kafka_authorization_iam_policy" {
  description = "Kafka authorization iam Policy ARN"
  value       = { for k in sort(keys(local.kafka_authorization_iam_policy_props)) : k => module.kafka_authorization_iam_policy[k].iam_policy_arn }
}
###############################
# Iam instance profile outputs
###############################
output "iam_instance_profile_id" {
  description = "Instance profile ID"
  value       = [ for k in sort(keys(local.iam_instance_profile_props)) :  module.iam_instance_profile[k].iam_instance_profile_id ]
}
output "iam_instance_profile_arn" {
  description = "Instance Profile ARN"
  value       = [ for k in sort(keys(local.iam_instance_profile_props)) :  module.iam_instance_profile[k].iam_instance_profile_arn ]
}
###########################
# Launch Template outputs
###########################
output "launch_template_id" {
  description = "Launch template ID"
  value       = [ for k in sort(keys(local.launch_template_props)) :  module.launch_template[k].launch_template_id ]
}
output "launch_template_arn" {
  description = "Launch template ARN"
  value       = [ for k in sort(keys(local.launch_template_props)) :  module.launch_template[k].launch_template_arn ]
}
output "launch_template_latest_version" {
  description = "Launch template latest version"
  value       = [ for k in sort(keys(local.launch_template_props)) :  module.launch_template[k].launch_template_latest_version ]
}
###################
# Key pair outputs
###################
output "key_pair_id" {
  description = "Key pair ID"
  value       = [ for k in sort(keys(local.key_pair_props)) :  module.key_pair[k].key_pair_id ]
}
output "key_pair_arn" {
  description = "Key pair ARN"
  value       = [ for k in sort(keys(local.key_pair_props)) :  module.key_pair[k].key_pair_arn ]
}
output "key_pair_name" {
  description = "Key pair Name"
  value       = [ for k in sort(keys(local.key_pair_props)) :  module.key_pair[k].key_pair_name ]
}
##################################
# Kafka client Instance outputs
#################################
output "kafka_client_instance_arn" {
  description = "Instance ARN"
  value       = [ for k in sort(keys(local.kafka_client_instance_props)) :  module.kafka_client_instance[k].instance_arn ]
}
output "kafka_client_instance_private_dns" {
  description = "Instance Private DNS"
  value       = [ for k in sort(keys(local.kafka_client_instance_props)) :  module.kafka_client_instance[k].instance_private_dns ]
}
output "kafka_client_instance_public_dns" {
  description = "Instance Public DNS"
  value       = [ for k in sort(keys(local.kafka_client_instance_props)) :  module.kafka_client_instance[k].instance_public_dns ]
}
output "kafka_client_instance_public_ip" {
  description = "Instance Public IP"
  value       = [ for k in sort(keys(local.kafka_client_instance_props)) :  module.kafka_client_instance[k].instance_public_ip ]
}
###############################
# S3 Bucket Resource outputs
###############################
output "streaming_artifacts_bucket_id" {
  description = "Bucket name"
  value       = { for k in sort(keys(local.s3_streaming_artifacts_bucket_props)) : k => module.streaming_artifacts_bucket[k].s3_bucket_id }
}
output "streaming_artifacts_bucket_arn" {
  description = "Bucket ARN"
  value       = { for k in sort(keys(local.s3_streaming_artifacts_bucket_props)) : k => module.streaming_artifacts_bucket[k].s3_bucket_arn }
}
output "kafka_connect_target_bucket_id" {
  description = "Bucket name"
  value       = { for k in sort(keys(local.s3_kafka_connect_target_bucket_props)) : k => module.kafka_connect_target_bucket[k].s3_bucket_id }
}
output "kafka_connect_target_bucket_arn" {
  description = "Bucket ARN"
  value       = { for k in sort(keys(local.s3_kafka_connect_target_bucket_props)) : k => module.kafka_connect_target_bucket[k].s3_bucket_arn }
}
####################################
# S3 VPC Endpoint Resource outputs
###################################
output "kafka_connect_vpc_endpoint_id" {
  description = "VPC endpoint ID"
  value       = { for k in sort(keys(local.s3_vpc_endpoint_props)) : k => module.kafka_connect_vpc_endpoint[k].vpc_endpoint_id }
}
output "kafka_connect_vpc_endpoint_arn" {
  description = "VPC endpoint ARN"
  value       = { for k in sort(keys(local.s3_vpc_endpoint_props)) : k => module.kafka_connect_vpc_endpoint[k].vpc_endpoint_arn }
}
output "kafka_connect_vpc_endpoint_cidr_blocks" {
  description = "CIDR blocks list of the exposed AWS service. Applicable for endpoints of type Gateway"
  value       = { for k in sort(keys(local.s3_vpc_endpoint_props)) : k => module.kafka_connect_vpc_endpoint[k].vpc_endpoint_cidr_blocks }
}
output "kafka_connect_vpc_endpoint_owner_id" {
  description = "AWS account ID for VPC endpoint owner"
  value       = { for k in sort(keys(local.s3_vpc_endpoint_props)) : k => module.kafka_connect_vpc_endpoint[k].vpc_endpoint_owner_id }
}
output "kafka_connect_vpc_endpoint_prefix_list_id" {
  description = "Prefix list ID of the exposed AWS service. Applicable for endpoints of type Gateway"
  value       = { for k in sort(keys(local.s3_vpc_endpoint_props)) : k => module.kafka_connect_vpc_endpoint[k].vpc_endpoint_prefix_list_id }
}
output "kafka_connect_vpc_endpoint_state" {
  description = "VPC endpoint state"
  value       = { for k in sort(keys(local.s3_vpc_endpoint_props)) : k => module.kafka_connect_vpc_endpoint[k].vpc_endpoint_state }
}
#####################################
# Glue VPC Endpoint Resource outputs
####################################
output "glue_vpc_endpoint_id" {
  description = "VPC endpoint ID"
  value       = { for k in sort(keys(local.glue_vpc_endpoint_props)) : k => module.glue_vpc_endpoint[k].vpc_endpoint_id }
}
output "glue_vpc_endpoint_arn" {
  description = "VPC endpoint ARN"
  value       = { for k in sort(keys(local.glue_vpc_endpoint_props)) : k => module.glue_vpc_endpoint[k].vpc_endpoint_arn }
}
output "glue_vpc_endpoint_state" {
  description = "VPC endpoint state"
  value       = { for k in sort(keys(local.glue_vpc_endpoint_props)) : k => module.glue_vpc_endpoint[k].vpc_endpoint_state }
}

#######################################
# ACMPCA Certificate Authority outputs
#######################################
output "acmpca_ca_arn" {
  description = "ACMPCA CA ARN"
  value       = { for k in sort(keys(local.acmpca_ca_props)) : k => module.acmpca_ca[k].acmpca_ca_arn }
}
output "acmpca_ca_id" {
  description = "ACMPCA CA ID"
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
#############################
# ACMPCA Certificate outputs
#############################
output "acmpca_certificate_arn" {
  description = "ACMPCA Certificate ARN"
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
#######################
# MSK KMS Key outputs
#######################
output "msk_kms_key_arn" {
  description = "KMS Key ARN"
  value       = { for k in sort(keys(local.msk_kms_key_props)) : k => module.msk_kms_key[k].kms_key_arn }
}
output "msk_kms_key_key_id" {
  description = "KMS Key ID"
  value       = { for k in sort(keys(local.msk_kms_key_props)) : k => module.msk_kms_key[k].kms_key_key_id }
}
###############################
# MSK broker log group outputs
###############################
output "msk_broker_log_group_arn" {
  description = "MSK broker log group ARN"
  value       = { for k in sort(keys(local.msk_broker_log_group_props)) : k => module.msk_broker_log_group[k].cloudwatch_log_group_arn }
}
output "msk_broker_log_group_name" {
  description = "MSK broker log group name"
  value       = { for k in sort(keys(local.msk_broker_log_group_props)) : k => module.msk_broker_log_group[k].cloudwatch_log_group_name }
}
###############################
# MSK Config Resource outputs
###############################
output "msk_configuration_arn" {
  description = "MSK Configuration ARN"
  value       = { for k in sort(keys(local.msk_configuration_props)) : k => module.msk_configuraion[k].msk_configuration_arn }
}
output "msk_configuration_latest_revision" {
  description = "MSK Configuration latest revision"
  value       = { for k in sort(keys(local.msk_configuration_props)) : k => module.msk_configuraion[k].msk_configuration_latest_revision }
}
###############################
# MSK Cluster Resource outputs
###############################
output "msk_cluster_arn" {
  description = "MSK Cluster ARN"
  value       = { for k in sort(keys(local.msk_cluster_props)) : k => module.msk_cluster[k].msk_cluster_arn }
}
output "msk_cluster_bootstrap_brokers" {
  description = "MSK Cluster Kafka broker endpoints"
  value       = { for k in sort(keys(local.msk_cluster_props)) : k => module.msk_cluster[k].msk_cluster_bootstrap_brokers }
}
output "msk_cluster_bootstrap_brokers_public_sasl_iam" {
  description = "MSK Cluster SASL IAM public broker endpoints"
  value       = { for k in sort(keys(local.msk_cluster_props)) : k => module.msk_cluster[k].msk_cluster_bootstrap_brokers_public_sasl_iam }
}
output "msk_cluster_bootstrap_brokers_public_tls" {
  description = "MSK Cluster TLS public broker endpoints"
  value       = { for k in sort(keys(local.msk_cluster_props)) : k => module.msk_cluster[k].msk_cluster_bootstrap_brokers_public_tls }
}
output "msk_cluster_bootstrap_brokers_sasl_iam" {
  description = "MSK Cluster SASL IAM broker endpoints"
  value       = { for k in sort(keys(local.msk_cluster_props)) : k => module.msk_cluster[k].msk_cluster_bootstrap_brokers_sasl_iam }
}
output "msk_cluster_bootstrap_brokers_tls" {
  description = "MSK Cluster TLS broker endpoints"
  value       = { for k in sort(keys(local.msk_cluster_props)) : k => module.msk_cluster[k].msk_cluster_bootstrap_brokers_tls }
}
output "msk_cluster_current_version" {
  description = "MSK Cluster current version"
  value       = { for k in sort(keys(local.msk_cluster_props)) : k => module.msk_cluster[k].msk_cluster_current_version }
}
output "msk_cluster_encryption_info_encryption_at_rest_kms_key_arn" {
  description = "KMS key ARN for encryption at rest data volume"
  value       = { for k in sort(keys(local.msk_cluster_props)) : k => module.msk_cluster[k].msk_cluster_encryption_info_encryption_at_rest_kms_key_arn }
}
output "msk_cluster_zookeeper_connect_string" {
  description = "MSK cluster zookeeper endpoint connect string"
  value       = { for k in sort(keys(local.msk_cluster_props)) : k => module.msk_cluster[k].msk_cluster_zookeeper_connect_string }
}
output "msk_cluster_zookeeper_connect_string_tls" {
  description = "MSK cluster zookeeper TLS endpoint connect string"
  value       = { for k in sort(keys(local.msk_cluster_props)) : k => module.msk_cluster[k].msk_cluster_zookeeper_connect_string }
}
###################################################
# Opensearch service VPC Endpoint Resource outputs
###################################################
output "opensearch_vpc_endpoint_id" {
  description = "Endpoint ID"
  value       = { for k in sort(keys(local.opensearch_service_vpc_endpoint_props)) : k => module.opensearch_vpc_endpoint[k].opensearch_vpc_endpoint_id }
}
output "opensearch_vpc_endpoint_endpoint" {
  description = "Domain connection endpoint ID"
  value       = { for k in sort(keys(local.opensearch_service_vpc_endpoint_props)) : k => module.opensearch_vpc_endpoint[k].opensearch_vpc_endpoint_endpoint }
}
######################################
# Opensearch service Resource outputs
######################################
output "opensearch_domain_arn" {
  description = "ARN of the domain"
  value       = { for k in sort(keys(local.opensearch_service_props)) : k => module.opensearch_service[k].opensearch_domain_arn }
}
output "opensearch_domain_domain_id" {
  description = "Unique identifier for the domain"
  value       = { for k in sort(keys(local.opensearch_service_props)) : k => module.opensearch_service[k].opensearch_domain_domain_id }
}
output "opensearch_domain_domain_name" {
  description = "Name of the OpenSearch domain"
  value       = { for k in sort(keys(local.opensearch_service_props)) : k => module.opensearch_service[k].opensearch_domain_domain_name }
}
output "opensearch_domain_endpoint" {
  description = "Domain-specific endpoint used to submit index, search, and data upload requests"
  value       = { for k in sort(keys(local.opensearch_service_props)) : k => module.opensearch_service[k].opensearch_domain_endpoint }
}
output "opensearch_domain_dashboard_endpoint" {
  description = "Domain-specific endpoint for Dashboard without https scheme"
  value       = { for k in sort(keys(local.opensearch_service_props)) : k => module.opensearch_service[k].opensearch_domain_dashboard_endpoint }
}
output "opensearch_domain_vpc_options_availability_zones" {
  description = "If the domain was created inside a VPC, the names of the availability zones the configured subnet_ids were created inside"
  value       = { for k in sort(keys(local.opensearch_service_props)) : k => module.opensearch_service[k].opensearch_domain_vpc_options_availability_zones }
}
output "opensearch_domain_vpc_options_vpc_id" {
  description = "If the domain was created inside a VPC, the ID of the VPC"
  value       = { for k in sort(keys(local.opensearch_service_props)) : k => module.opensearch_service[k].opensearch_domain_vpc_options_vpc_id }
}
###################################
# KDA cloudwatch log group outputs
###################################
output "kda_cloudwatch_log_group_arn" {
  description = "KDA cloudwatch log group ARN"
  value       = { for k in sort(keys(local.kda_cloudwatch_log_group_props)) : k => module.kda_cloudwatch_log_group[k].cloudwatch_log_group_arn }
}
output "kda_cloudwatch_log_group_name" {
  description = "KDA cloudwatch log group name"
  value       = { for k in sort(keys(local.kda_cloudwatch_log_group_props)) : k => module.kda_cloudwatch_log_group[k].cloudwatch_log_group_name }
}
#####################################
# KDA cloudwatch log stream outputs
#####################################
output "kda_cloudwatch_log_stream_arn" {
  description = "Log stream ARN"
  value       = { for k in sort(keys(local.kda_cloudwatch_log_stream_props)) : k => module.kda_cloudwatch_log_stream[k].cloudwatch_log_stream_arn }
}
##############################################
# Clickstream Glue registry resource  outputs
##############################################
output "clickstream_registry_arn" {
  description = "Glue Registry ARN"
  value       = [ for k in sort(keys(local.clickstream_registry_props)) : module.clickstream_registry[k].glue_registry_arn ]
}
############################################
# Clickstream Glue Schema resource  outputs
############################################
output "clickstream_schema_arn" {
  description = "Schema ARN"
  value       = [ for k in sort(keys(local.clickstream_schema_props)) : module.clickstream_schema[k].glue_schema_arn ]
}
#######################################################################
# Kdaflinkclickstream kinesisanalyticsv2 application Resource outputs
######################################################################
output "kdaflinkclickstream_application_id" {
  description = "Application identifier"
  value       = { for k in sort(keys(local.kinesisanalyticsv2_application_props)) : k => module.kdaflinkclickstream_application[k].kinesisanalyticsv2_application_id }
}
output "kdaflinkclickstream_application_arn" {
  description = "ARN of the application"
  value       = { for k in sort(keys(local.kinesisanalyticsv2_application_props)) : k => module.kdaflinkclickstream_application[k].kinesisanalyticsv2_application_arn }
}
output "kdaflinkclickstream_application_create_timestamp" {
  description = "The current timestamp when the application was created"
  value       = { for k in sort(keys(local.kinesisanalyticsv2_application_props)) : k => module.kdaflinkclickstream_application[k].kinesisanalyticsv2_application_create_timestamp }
}
output "kdaflinkclickstream_application_last_update_timestamp" {
  description = "The current timestamp when the application was last updated."
  value       = { for k in sort(keys(local.kinesisanalyticsv2_application_props)) : k => module.kdaflinkclickstream_application[k].kinesisanalyticsv2_application_last_update_timestamp }
}
output "kdaflinkclickstream_application_status" {
  description = "Application status"
  value       = { for k in sort(keys(local.kinesisanalyticsv2_application_props)) : k => module.kdaflinkclickstream_application[k].kinesisanalyticsv2_application_status }
}
output "kdaflinkclickstream_application_version_id" {
  description = "Application current version. Kinesis Data Analytics updates the version_id each time the application is updated"
  value       = { for k in sort(keys(local.kinesisanalyticsv2_application_props)) : k => module.kdaflinkclickstream_application[k].kinesisanalyticsv2_application_version_id }
}
