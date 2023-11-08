terraform {
  required_version = ">= 1.5.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.1"
    }
    local = {
      source = "hashicorp/local"
      version = "~> 2.3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
module "vpc" {

  source = "../../modules/vpc"

  for_each = local.vpc_props

  vpc_cidr_block            = each.value.cidr_block
  vpc_enable_dns_hostnames  = each.value.enable_dns_hostnames
  vpc_enable_dns_support    = each.value.enable_dns_support
  vpc_tags                  = each.value.tags
}
module "vpc_dhcp_options" {
  source = "../../modules/vpc_dhcp_options"

  for_each = local.dhcp_options_props

  vpc_dhcp_options_domain_name          = each.value.domain_name
  vpc_dhcp_options_domain_name_servers  = each.value.domain_name_servers
  vpc_dhcp_options_tags                 = each.value.tags
}
module "vpc_dhcp_options_assoc" {
  source = "../../modules/vpc_dhcp_options_assoc"

  for_each = local.dhcp_options_assoc_props

  dhcp_options_association_vpc_id          = each.value.vpc_id
  dhcp_options_association_dhcp_options_id = each.value.dhcp_options_id
}
module "eip" {
  source = "../../modules/eip"

  for_each = local.eip_props

  eip_vpc  = each.value.vpc
}
module "public_subnet_1a" {
  source = "../../modules/subnet"

  for_each = local.public_subnet_1a_props

  subnet_vpc_id                    = each.value.vpc_id
  subnet_cidr_block                = each.value.cidr_block
  subnet_availability_zone         = each.value.availability_zone
  subnet_map_public_ip_on_launch   = each.value.map_public_ip_on_launch
  subnet_tags                      = each.value.tags
}
module "public_subnet_1b" {
  source = "../../modules/subnet"

  for_each = local.public_subnet_1b_props

  subnet_vpc_id                    = each.value.vpc_id
  subnet_cidr_block                = each.value.cidr_block
  subnet_availability_zone         = each.value.availability_zone
  subnet_map_public_ip_on_launch   = each.value.map_public_ip_on_launch
  subnet_tags                      = each.value.tags
}
module "public_subnet_1c" {
  source = "../../modules/subnet"

  for_each = local.public_subnet_1c_props

  subnet_vpc_id                    = each.value.vpc_id
  subnet_cidr_block                = each.value.cidr_block
  subnet_availability_zone         = each.value.availability_zone
  subnet_map_public_ip_on_launch   = each.value.map_public_ip_on_launch
  subnet_tags                      = each.value.tags
}
module "private_subnet_1a" {
  source = "../../modules/subnet"

  for_each = local.private_subnet_1a_props

  subnet_vpc_id                    = each.value.vpc_id
  subnet_cidr_block                = each.value.cidr_block
  subnet_availability_zone         = each.value.availability_zone
  subnet_map_public_ip_on_launch   = each.value.map_public_ip_on_launch
  subnet_tags                      = each.value.tags
}
module "private_subnet_1b" {
  source = "../../modules/subnet"

  for_each = local.private_subnet_1b_props

  subnet_vpc_id                    = each.value.vpc_id
  subnet_cidr_block                = each.value.cidr_block
  subnet_availability_zone         = each.value.availability_zone
  subnet_map_public_ip_on_launch   = each.value.map_public_ip_on_launch
  subnet_tags                      = each.value.tags
}
module "private_subnet_1c" {
  source = "../../modules/subnet"

  for_each = local.private_subnet_1c_props

  subnet_vpc_id                    = each.value.vpc_id
  subnet_cidr_block                = each.value.cidr_block
  subnet_availability_zone         = each.value.availability_zone
  subnet_map_public_ip_on_launch   = each.value.map_public_ip_on_launch
  subnet_tags                      = each.value.tags
}
module "public_route_table" {
  source = "../../modules/route_table"

  for_each = local.public_route_table_props

  route_table_vpc_id = each.value.vpc_id
}
module "private_route_table" {
  source = "../../modules/route_table"

  for_each = local.private_route_table_props

  route_table_vpc_id = each.value.vpc_id
}
module "public_route_table_association" {
  source = "../../modules/route_table_association"

  for_each = local.public_route_table_assoc_props

  route_table_association_subnet_id        = each.value.subnet_id
  route_table_association_route_table_id   = each.value.route_table_id

}
module "private_route_table_association" {
  source = "../../modules/route_table_association"

  for_each = local.private_route_table_assoc_props

  route_table_association_subnet_id       = each.value.subnet_id
  route_table_association_route_table_id  = each.value.route_table_id

}
module "internet_gateway" {
  source = "../../modules/internet_gateway"

  for_each = local.igw_props

  internet_gateway_vpc_id  = each.value.vpc_id
  internet_gateway_tags    = each.value.tags

  depends_on = [
    module.public_subnet_1a,
    module.public_subnet_1b,
    module.public_subnet_1c,
  ]
}
module "nat_gateway" {
  source = "../../modules/nat_gateway"

  for_each = local.ngw_props

  nat_gateway_allocation_id = each.value.allocation_id
  nat_gateway_subnet_id     = each.value.subnet_id

  depends_on = [
    module.private_subnet_1a,
    module.private_subnet_1b,
    module.private_subnet_1c,
  ]
}
module "internet_gateway_route" {
  source = "../../modules/route"

  for_each =  local.public_route_props

  route_route_table_id         = each.value.route_table_id
  route_gateway_id             = each.value.gateway_id
  route_destination_cidr_block = each.value.destination_cidr_block
  depends_on = [
    module.public_route_table,
    module.internet_gateway,
  ]
}
module "nat_gateway_route" {
  source = "../../modules/route"

  for_each =  local.private_route_props

  route_route_table_id         = each.value.route_table_id
  route_nat_gateway_id         = each.value.nat_gateway_id
  route_destination_cidr_block = each.value.destination_cidr_block
  depends_on = [
    module.private_route_table,
    module.nat_gateway,
  ]
}
module "security_group" {
  source = "../../modules/security_group"

  for_each = local.security_group_props

  security_group_name         = each.value.name
  security_group_description  = each.value.description
  security_group_vpc_id       = each.value.vpc_id
}
module "vpc_security_group_rule" {
  source = "../../modules/vpc_security_group_rule"

  for_each = local.security_group_rule_props

  security_group_rule_cidr_blocks              = each.value.cidr_blocks
  security_group_rule_description              = each.value.description
  security_group_rule_from_port                = each.value.from_port
  security_group_rule_protocol                 = each.value.protocol
  security_group_rule_security_group_id        = each.value.security_group_id
  security_group_rule_source_security_group_id = each.value.source_security_group_id
  security_group_rule_to_port                  = each.value.to_port
  security_group_rule_type                     = each.value.type
}
module "ec2_iam_role" {
  source = "../../modules/iam_role"

  for_each = local.ec2_iam_role_props

  iam_role_name               = each.value.name
  iam_role_description        = each.value.description
  iam_role_assume_role_policy = each.value.assume_role_policy
  iam_role_path               = each.value.path
  iam_role_tags               = each.value.tags
}
module "ec2_iam_role_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.ec2_iam_role_policy_attachment_props

  iam_role_policy_attachment_role        = each.value.role
  iam_role_policy_attachment_policy_arn  = each.value.policy_arn
}
module "kafka_authorization_iam_policy" {
  source = "../../modules/iam_policy"

   for_each = local.kafka_authorization_iam_policy_props

   iam_policy_name        = each.value.name
   iam_policy_description = each.value.description
   iam_policy_policy      = each.value.policy
   iam_policy_path        = each.value.path
   iam_policy_tags        = each.value.tags
}
module "kafka_connect_iam_role" {
  source = "../../modules/iam_role"

  for_each = local.kafka_connect_iam_role_props

  iam_role_name               = each.value.name
  iam_role_description        = each.value.description
  iam_role_assume_role_policy = each.value.assume_role_policy
  iam_role_path               = each.value.path
  iam_role_tags               = each.value.tags
}
module "kafka_connect_iam_policy" {
  source = "../../modules/iam_policy"

   for_each = local.kafka_connect_iam_policy_props

   iam_policy_name        = each.value.name
   iam_policy_description = each.value.description
   iam_policy_policy      = each.value.policy
   iam_policy_path        = each.value.path
   iam_policy_tags        = each.value.tags
}
module "kafka_connect_iam_role_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.kafka_connect_iam_role_policy_attachment_props

  iam_role_policy_attachment_role        = each.value.role
  iam_role_policy_attachment_policy_arn  = each.value.policy_arn
}
module "key_pair" {
  source = "../../modules/key_pair"

  for_each = local.key_pair_props

  key_pair_key_name   = each.value.key_name
  key_pair_public_key = each.value.public_key
}
module "iam_instance_profile" {
  source = "../../modules/iam_instance_profile"

  for_each = local.iam_instance_profile_props

  iam_instance_profile_name = each.value.name
  iam_instance_profile_path = each.value.path
  iam_instance_profile_role = each.value.role
}
module "launch_template" {
  source = "../../modules/launch_template"

  for_each = local.launch_template_props

  launch_template_default_version          = each.value.default_version
  launch_template_description              = each.value.description
  launch_template_disable_api_stop         = each.value.disable_api_stop
  launch_template_disable_api_termination  = each.value.disable_api_termination
  launch_template_ebs_optimized            = each.value.ebs_optimized
  launch_template_image_id                 = each.value.image_id
  launch_template_instance_type            = each.value.instance_type
  launch_template_key_name                 = each.value.key_name
  launch_template_name                     = each.value.name
  launch_template_user_data                = each.value.user_data
  launch_template_block_device_mappings    = each.value.block_device_mappings
  launch_template_iam_instance_profile     = each.value.iam_instance_profile
  launch_template_metadata_options         = each.value.metadata_options
  launch_template_monitoring               = each.value.monitoring
  launch_template_network_interfaces       = each.value.network_interfaces

  depends_on = [
    module.key_pair,
  ]
}
module "kafka_client_instance" {
  source = "../../modules/instance"

  for_each = local.kafka_client_instance_props

  instance_associate_public_ip_address = each.value.associate_public_ip_address
  instance_availability_zone           = each.value.availability_zone
  instance_subnet_id                   = each.value.subnet_id
  instance_tags                        = each.value.tags
  instance_volume_tags                 = each.value.volume_tags
  instance_launch_template             = each.value.launch_template
} 
module "time_sleep" {
  source = "../../modules/time_sleep"

  for_each = local.time_sleep_props

  sleep_create_duration = each.value.create_duration

  depends_on = [
    module.kafka_client_instance,
  ]
}
module "kafka_connect_target_bucket" {
  source = "../../modules/s3_bucket"

  for_each = local.s3_kafka_connect_target_bucket_props

  s3_bucket_bucket = each.value.bucket
  s3_bucket_tags   = each.value.tags
}
module "s3_object" {
  source = "../../modules/s3_object"

  for_each = local.s3_object_props

  s3_object_bucket = each.value.bucket
  s3_object_key    = each.value.key
}
module "s3_object_file_upload" {
  source = "../../modules/s3_object"

  for_each = local.s3_object_file_upload_props

  s3_object_bucket       = each.value.bucket
  s3_object_key          = each.value.key
  s3_object_source       = each.value.source
  s3_object_source_hash  = each.value.source_hash
  s3_object_content_type = each.value.content_type

  depends_on = [
    module.s3_object,
  ]
}
module "acmpca_certificate" {
  source = "../../modules/acmpca_certificate"

  for_each = local.acmpca_certificate_props

  acmpca_certificate_certificate_authority_arn   = each.value.certificate_authority_arn
  acmpca_certificate_certificate_signing_request = each.value.certificate_signing_request
  acmpca_certificate_signing_algorithm           = each.value.signing_algorithm
  acmpca_certificate_template_arn                = each.value.template_arn
  acmpca_certificate_validity                    = each.value.validity
}
module "acmpca_ca" {
  source = "../../modules/acmpca_certificate_authority"

  for_each = local.acmpca_ca_props

  certificate_authority_usage_mode                          = each.value.usage_mode
  certificate_authority_tags                                = each.value.tags
  certificate_authority_type                                = each.value.type
  certificate_authority_certificate_authority_configuration = each.value.certificate_authority_configuration
  certificate_authority_revocation_configuration            = each.value.revocation_configuration
}
module "acmpca_ca_certificate" {
  source = "../../modules/acmpca_certificate_authority_certificate"

  for_each = local.acmpca_ca_certificate_props

  certificate_authority_certificate_certificate               = each.value.certificate
  certificate_authority_certificate_certificate_authority_arn = each.value.certificate_authority_arn
}
module "msk_kms_key" {
  source = "../../modules/kms_key"

  for_each = local.msk_kms_key_props

  kms_key_description = each.value.description
  kms_key_tags        = each.value.tags
}
module "msk_broker_log_group" {
  source = "../../modules/cloudwatch_log_group"

  for_each = local.msk_broker_log_group_props

  cloudwatch_log_group_name              = each.value.name
  cloudwatch_log_group_retention_in_days = each.value.retention_in_days
  cloudwatch_log_group_tags              = each.value.tags 
}
module "mskconnect_log_group" {
  source = "../../modules/cloudwatch_log_group"

  for_each = local.mskconnect_log_group_props

  cloudwatch_log_group_name              = each.value.name
  cloudwatch_log_group_retention_in_days = each.value.retention_in_days
  cloudwatch_log_group_tags              = each.value.tags 
}
module "msk_configuraion" {
  source = "../../modules/msk_configuration"

  for_each = local.msk_configuration_props

  msk_configuration_description       = each.value.description
  msk_configuration_kafka_versions    = each.value.kafka_versions
  msk_configuration_name              = each.value.name
  msk_configuration_server_properties = each.value.server_properties
}
module "debezium_mysql_worker_configuraion" {
  source = "../../modules/mskconnect_worker_configuration"

  for_each = local.mskconnect_workers_configuration_props

  mskconnect_worker_configuration_description             = each.value.description
  mskconnect_worker_configuration_name                    = each.value.name
  mskconnect_worker_configuration_properties_file_content = each.value.properties_file_content
}
module "debezium_mysql_custom_plugin" {
  source = "../../modules/mskconnect_custom_plugin"

  for_each = local.mskconnect_custom_plugin_props

  mskconnect_custom_plugin_content_type = each.value.content_type
  mskconnect_custom_plugin_description  = each.value.description
  mskconnect_custom_plugin_name         = each.value.name
  mskconnect_custom_plugin_location     = each.value.location

  depends_on = [
    module.time_sleep,
  ]
}
module "debezium_mysql_connector" {
  source = "../../modules/mskconnect_connector"

  for_each = local.mskconnect_props
 
  mskconnect_connector_connector_configuration             = each.value.connector_configuration
  mskconnect_connector_description                         = each.value.description
  mskconnect_connector_kafkaconnect_version                = each.value.kafkaconnect_version
  mskconnect_connector_name                                = each.value.name
  mskconnect_connector_service_execution_role_arn          = each.value.service_execution_role_arn
  mskconnect_connector_capacity                            = each.value.capacity
  mskconnect_connector_kafka_cluster                       = each.value.kafka_cluster
  mskconnect_connector_kafka_cluster_client_authentication = each.value.kafka_cluster_client_authentication
  mskconnect_connector_kafka_cluster_encryption_in_transit = each.value.kafka_cluster_encryption_in_transit
  mskconnect_connector_log_delivery                        = each.value.log_delivery
  mskconnect_connector_plugin                              = each.value.plugin
  mskconnect_connector_worker_configuration                = each.value.worker_configuration
}
module "msk_cluster" {
  source = "../../modules/msk_cluster"

  for_each = local.msk_cluster_props

  msk_cluster_cluster_name           = each.value.cluster_name
  msk_cluster_enhanced_monitoring    = each.value.enhanced_monitoring
  msk_cluster_kafka_version          = each.value.kafka_version
  msk_cluster_number_of_broker_nodes = each.value.number_of_broker_nodes
  msk_cluster_tags                   = each.value.tags
  msk_cluster_broker_node_group_info = each.value.broker_node_group_info
  msk_cluster_client_authentication  = each.value.client_authentication
  msk_cluster_configuration_info     = each.value.configuration_info
  msk_cluster_encryption_info        = each.value.encryption_info
  msk_cluster_logging_info           = each.value.logging_info
  msk_cluster_open_monitoring        = each.value.open_monitoring  

  depends_on = [
    module.private_subnet_1a,
    module.private_subnet_1b,
    module.private_subnet_1c,
  ]
}
module "sales_db_subnet_group" {
  source = "../../modules/db_subnet_group"

  for_each = local.db_subnet_group_props

  db_subnet_group_name        = each.value.name
  db_subnet_group_description = each.value.description
  db_subnet_group_subnet_ids  = each.value.subnet_ids
  db_subnet_group_tags        = each.value.tags
}
module "sales_db_parameter_group" {
  source = "../../modules/db_parameter_group"

  for_each = local.db_parameter_group_props

  db_parameter_group_name        = each.value.name
  db_parameter_group_family      = each.value.family
  db_parameter_group_description = each.value.description
  db_parameter_group_tags        = each.value.tags
  db_parameter_group_parameter   = each.value.parameter
}
module "sales_db_rds_cluster_parameter_group" {
  source = "../../modules/rds_cluster_parameter_group"

  for_each = local.rds_cluster_parameter_group_props

  rds_cluster_parameter_group_description = each.value.description
  rds_cluster_parameter_group_family      = each.value.family
  rds_cluster_parameter_group_name        = each.value.name
  rds_cluster_parameter_group_tags        = each.value.tags
  rds_cluster_parameter_group_parameter   = each.value.parameter
}
module "sales_db_rds_cluster" {
  source = "../../modules/rds_cluster"

  for_each = local.rds_cluster_props

  rds_cluster_database_name                   = each.value.database_name
  rds_cluster_db_cluster_parameter_group_name = each.value.db_cluster_parameter_group_name
  rds_cluster_db_subnet_group_name            = each.value.db_subnet_group_name
  rds_cluster_engine                          = each.value.engine
  rds_cluster_master_password                 = each.value.master_password
  rds_cluster_master_username                 = each.value.master_username
  rds_cluster_vpc_security_group_ids          = each.value.vpc_security_group_ids
}
module "sales_db_rds_cluster_instance" {
  source = "../../modules/rds_cluster_instance"

  for_each = local.rds_cluster_instance_props

  rds_cluster_instance_cluster_identifier           = each.value.cluster_identifier
  rds_cluster_instance_db_parameter_group_name      = each.value.db_parameter_group_name
  rds_cluster_instance_db_subnet_group_name         = each.value.db_subnet_group_name
  rds_cluster_instance_engine                       = each.value.engine
  rds_cluster_instance_identifier                   = each.value.identifier
  rds_cluster_instance_instance_class               = each.value.instance_class
  rds_cluster_instance_performance_insights_enabled = each.value.performance_insights_enabled 
  rds_cluster_instance_tags                         = each.value.tags
}
