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
output "kafka_connect_target_bucket_id" {
  description = "Bucket name"
  value       = { for k in sort(keys(local.s3_kafka_connect_target_bucket_props)) : k => module.kafka_connect_target_bucket[k].s3_bucket_id }
}
output "kafka_connect_target_bucket_arn" {
  description = "Bucket ARN"
  value       = { for k in sort(keys(local.s3_kafka_connect_target_bucket_props)) : k => module.kafka_connect_target_bucket[k].s3_bucket_arn }
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
output "mskconnect_log_group_arn" {
  description = "MSKConnect log group ARN"
  value       = { for k in sort(keys(local.mskconnect_log_group_props)) : k => module.mskconnect_log_group[k].cloudwatch_log_group_arn }
}
output "mskconnect_log_group_name" {
  description = "MSKConnect log group name"
  value       = { for k in sort(keys(local.mskconnect_log_group_props)) : k => module.mskconnect_log_group[k].cloudwatch_log_group_name }
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
#############################################
# MSKConnect workers Config Resource outputs
#############################################
output "debezium_mysql_worker_configuration_arn" {
  description = "MSKConnect worker configuration ARN"
  value       = { for k in sort(keys(local.mskconnect_workers_configuration_props)) : k => module.debezium_mysql_worker_configuraion[k].mskconnect_worker_configuration_arn }
}
output "debezium_mysql_worker_configuration_latest_revision" {
  description = "MSKConnect worker configuration lastest revision ID"
  value       = { for k in sort(keys(local.mskconnect_workers_configuration_props)) : k => module.debezium_mysql_worker_configuraion[k].mskconnect_worker_configuration_latest_revision }
}
############################################
# MSKConnect Custom Plugin Resource outputs
###########################################
output "debezium_mysql_custom_plugin_arn" {
  description = "Debezium MySql plugin ARN"
  value       = { for k in sort(keys(local.mskconnect_custom_plugin_props)) : k => module.debezium_mysql_custom_plugin[k]. mskconnect_custom_plugin_arn}
}
output "debezium_mysql_custom_plugin_latest_revision" {
  description = "Debezium MySql plugin latest revision ID"
  value       = { for k in sort(keys(local.mskconnect_custom_plugin_props)) : k => module.debezium_mysql_custom_plugin[k].mskconnect_custom_plugin_latest_revision }
}
output "debezium_mysql_custom_plugin_state" {
  description = "Debezium MySql plugin state"
  value       = { for k in sort(keys(local.mskconnect_custom_plugin_props)) : k => module.debezium_mysql_custom_plugin[k].mskconnect_custom_plugin_state }
}
############################################
# MSKConnect Connector Resource outputs
###########################################
output "debezium_mysql_connector_arn" {
  description = "ARN of the connector"
  value       = { for k in sort(keys(local.mskconnect_props)) : k => module.debezium_mysql_connector[k].mskconnect_connector_arn }
}
output "debezium_mysql_connector_version" {
  description = "The current version of the connector"
  value       = { for k in sort(keys(local.mskconnect_props)) : k => module.debezium_mysql_connector[k].mskconnect_connector_version }
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
###########################################
# Sales DB subnet group resource output
###########################################
output "sales_db_subnet_group_id" {
  description = "DB subnet group name"
  value       = { for k in sort(keys(local.db_subnet_group_props)) : k => module.sales_db_subnet_group[k].db_subnet_group_id }
}
output "sales_db_subnet_group_arn" {
  description = "ARN of the db subnet group"
  value       = { for k in sort(keys(local.db_subnet_group_props)) : k => module.sales_db_subnet_group[k].db_subnet_group_arn }
}
###########################################
# Sales DB Parameter group resource output
###########################################
output "sales_db_parameter_group_name" {
  description = "DB parameter group name"
  value       = { for k in sort(keys(local.db_parameter_group_props)) : k => module.sales_db_parameter_group[k].db_parameter_group_name }
}
output "sales_db_parameter_group_arn" {
  description = "ARN of the db parameter group"
  value       = { for k in sort(keys(local.db_parameter_group_props)) : k => module.sales_db_parameter_group[k].db_parameter_group_arn }
}
#######################################################
# Sales DB rds cluster parameter group resource output
#######################################################
output "sales_db_rds_cluster_parameter_group_id" {
  description = "DB cluster parameter group name"
  value       = { for k in sort(keys(local.rds_cluster_parameter_group_props)) : k => module.sales_db_rds_cluster_parameter_group[k].rds_cluster_parameter_group_id }
}
output "sales_db_rds_cluster_parameter_group_arn" {
  description = "ARN of the db cluster parameter group"
  value       = { for k in sort(keys(local.rds_cluster_parameter_group_props)) : k => module.sales_db_rds_cluster_parameter_group[k].rds_cluster_parameter_group_arn }
}
#######################################
# Sales DB RDS Cluster resource output
#######################################
output "sales_db_rds_cluster_arn" {
  description = "ARN of cluster"
  value       = { for k in sort(keys(local.rds_cluster_props)) : k => module.sales_db_rds_cluster[k].rds_cluster_arn }
}
output "sales_db_rds_cluster_id" {
  description = "RDS Cluster Identifier"
  value       = { for k in sort(keys(local.rds_cluster_props)) : k => module.sales_db_rds_cluster[k].rds_cluster_id }
}
output "sales_db_rds_cluster_cluster_identifier" {
  description = "RDS Cluster Identifier"
  value       = { for k in sort(keys(local.rds_cluster_props)) : k => module.sales_db_rds_cluster[k].rds_cluster_cluster_identifier }
}
output "sales_db_rds_cluster_cluster_members" {
  description = "List of RDS Instances that are a part of this cluster"
  value       = { for k in sort(keys(local.rds_cluster_props)) : k => module.sales_db_rds_cluster[k].rds_cluster_cluster_members }
}
output "sales_db_rds_cluster_availability_zones" {
  description = "The availability zone of the instance"
  value       = { for k in sort(keys(local.rds_cluster_props)) : k => module.sales_db_rds_cluster[k].rds_cluster_availability_zones }
}
output "sales_db_rds_cluster_endpoint" {
  description = "DNS address of the RDS instance"
  value       = { for k in sort(keys(local.rds_cluster_props)) : k => module.sales_db_rds_cluster[k].rds_cluster_endpoint }
}
output "sales_db_rds_cluster_reader_endpoint" {
  description = "A read-only endpoint for the Aurora cluster, automatically load-balanced across replicas"
  value       = { for k in sort(keys(local.rds_cluster_props)) : k => module.sales_db_rds_cluster[k].rds_cluster_reader_endpoint }
}
output "sales_db_rds_cluster_engine" {
  description = "Database engine"
  value       = { for k in sort(keys(local.rds_cluster_props)) : k => module.sales_db_rds_cluster[k].rds_cluster_engine }
}
output "sales_db_rds_cluster_engine_version_actual" {
  description = "The running version of the database"
  value       = { for k in sort(keys(local.rds_cluster_props)) : k => module.sales_db_rds_cluster[k].rds_cluster_engine_version_actual }
}
output "sales_db_rds_cluster_database_name" {
  description = "The database name"
  value       = { for k in sort(keys(local.rds_cluster_props)) : k => module.sales_db_rds_cluster[k].rds_cluster_database_name }
}
output "sales_db_rds_cluster_port" {
  description = "The database port"
  value       = { for k in sort(keys(local.rds_cluster_props)) : k => module.sales_db_rds_cluster[k].rds_cluster_port }
}
################################################
# Sales DB RDS Cluster instance resource output
################################################
output "sales_db_rds_cluster_instance_arn" {
  description = "ARN of cluster instance"
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_arn }
}
output "sales_db_rds_cluster_instance_cluster_identifier" {
  description = "RDS Cluster Identifier"
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_cluster_identifier }
}
output "sales_db_rds_cluster_instance_identifier" {
  description = "Instance identifier"
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_identifier }
}
output "sales_db_rds_cluster_instance_id" {
  description = "Instance identifier"
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_id }
}
output "sales_db_rds_cluster_instance_writer" {
  description = "Whether instance is writable. False indicates this instance is a read replica"
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_writer }
}
output "sales_db_rds_cluster_instance_availability_zone" {
  description = "Availability zone of the instance"
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_availability_zone }
}
output "sales_db_rds_cluster_instance_endpoint" {
  description = "The DNS address for this instance. May not be writable"
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_endpoint }
}
output "sales_db_rds_cluster_instance_engine" {
  description = "Database engine"
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_engine }
}
output "sales_db_rds_cluster_instance_engine_version_actual" {
  description = "Database engine version"
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_engine_version_actual }
}
output "sales_db_rds_cluster_instance_port" {
  description = "Database port"
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_port }
}
output "sales_db_rds_cluster_instance_storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted"
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_storage_encrypted }
}
output "sales_db_rds_cluster_instance_kms_key_id" {
  description = "ARN of this KMS encryption key if one is set to the cluster."
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_kms_key_id }
}
output "sales_db_rds_cluster_instance_network_type" {
  description = "Network type of the DB instance"
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_network_type }
}
output "sales_db_rds_cluster_instance_dbi_resource_id" {
  description = "Region-unique, immutable identifier for the DB instance."
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_dbi_resource_id }
}
output "sales_db_rds_cluster_instance_performance_insights_enabled" {
  description = "Specifies whether Performance Insights is enabled or not"
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_performance_insights_enabled }
}
output "sales_db_rds_cluster_instance_performance_insights_kms_key_id" {
  description = "ARN of the KMS encryption key used by Performance Insights"
  value       = { for k in sort(keys(local.rds_cluster_instance_props)) : k => module.sales_db_rds_cluster_instance[k].rds_cluster_instance_performance_insights_kms_key_id }
}
