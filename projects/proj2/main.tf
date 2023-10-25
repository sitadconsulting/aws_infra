terraform {
  required_version = ">= 1.3.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.0"
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
module "kda_iam_role" {
  source = "../../modules/iam_role"

  for_each = local.kda_iam_role_props

  iam_role_name               = each.value.name
  iam_role_description        = each.value.description
  iam_role_assume_role_policy = each.value.assume_role_policy
  iam_role_path               = each.value.path
  iam_role_tags               = each.value.tags
}
module "kda_iam_role_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.kda_iam_role_policy_attachment_props

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
module "streaming_artifacts_bucket" {
  source = "../../modules/s3_bucket"

  for_each = local.s3_streaming_artifacts_bucket_props

  s3_bucket_bucket = each.value.bucket
  s3_bucket_tags   = each.value.tags
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

  depends_on = [
    module.streaming_artifacts_bucket,
  ]
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
module "kafka_connect_vpc_endpoint" {
  source = "../../modules/vpc_endpoint"

  for_each = local.s3_vpc_endpoint_props

  vpc_endpoint_route_table_ids   = each.value.route_table_ids
  vpc_endpoint_service_name      = each.value.service_name
  vpc_endpoint_vpc_id            = each.value.vpc_id
  vpc_endpoint_vpc_endpoint_type = each.value.vpc_endpoint_type 
}
module "glue_vpc_endpoint" {
  source = "../../modules/vpc_endpoint"

  for_each = local.glue_vpc_endpoint_props

  vpc_endpoint_ip_address_type     = each.value.ip_address_type
  vpc_endpoint_private_dns_enabled = each.value.private_dns_enabled 
  vpc_endpoint_security_group_id   = each.value.security_group_id
  vpc_endpoint_service_name        = each.value.service_name
  vpc_endpoint_subnet_ids          = each.value.subnet_ids
  vpc_endpoint_vpc_id              = each.value.vpc_id
  vpc_endpoint_vpc_endpoint_type   = each.value.vpc_endpoint_type
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
module "msk_configuraion" {
  source = "../../modules/msk_configuration"

  for_each = local.msk_configuration_props

  msk_configuration_description       = each.value.description
  msk_configuration_kafka_versions    = each.value.kafka_versions
  msk_configuration_name              = each.value.name
  msk_configuration_server_properties = each.value.server_properties

  depends_on = [
    module.s3_object_file_upload,
  ]
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
module "opensearch_vpc_endpoint" {
  source = "../../modules/opensearch_vpc_endpoint"

  for_each = local.opensearch_service_vpc_endpoint_props
 
  opensearch_vpc_endpoint_domain_arn  = each.value.domain_arn
  opensearch_vpc_endpoint_vpc_options = each.value.vpc_options
}
module "opensearch_service" {
  source = "../../modules/opensearch_domain"

  for_each = local.opensearch_service_props

  opensearch_domain_access_policies           = each.value.access_policies
  opensearch_domain_domain_name               = each.value.domain_name
  opensearch_domain_engine_version            = each.value.engine_version
  opensearch_domain_advanced_security_options = each.value.advanced_security_options 
  opensearch_domain_cluster_config            = each.value.cluster_config
  opensearch_domain_domain_endpoint_options   = each.value.domain_endpoint_options
  opensearch_domain_ebs_options               = each.value.ebs_options
  opensearch_domain_encrypt_at_rest           = each.value.encrypt_at_rest
  opensearch_domain_node_to_node_encryption   = each.value.node_to_node_encryption
  opensearch_domain_vpc_options               = each.value.vpc_options
}
module "kda_cloudwatch_log_group" {
  source = "../../modules/cloudwatch_log_group"

  for_each = local.kda_cloudwatch_log_group_props

  cloudwatch_log_group_name              = each.value.name
  cloudwatch_log_group_retention_in_days = each.value.retention_in_days
  cloudwatch_log_group_tags              = each.value.tags 
}
module "kda_cloudwatch_log_stream" {
  source = "../../modules/cloudwatch_log_stream"

  for_each = local.kda_cloudwatch_log_stream_props

  cloudwatch_log_stream_log_group_name = each.value.log_group_name
  cloudwatch_log_stream_name           = each.value.name
}
module "clickstream_registry" {
  source = "../../modules/glue_registry"

  for_each = local.clickstream_registry_props

  glue_registry_description   = each.value.description
  glue_registry_registry_name = each.value.registry_name
}
module "clickstream_schema" {
  source = "../../modules/glue_schema"

  for_each = local.clickstream_schema_props

  glue_schema_compatibility     = each.value.compatibility
  glue_schema_data_format       = each.value.data_format
  glue_schema_description       = each.value.description
  glue_schema_registry_arn      = each.value.registry_arn
  glue_schema_schema_name       = each.value.schema_name
  glue_schema_schema_definition = each.value.schema_definition
}
module "kdaflinkclickstream_application" {
  source = "../../modules/kinesisanalyticsv2_application"

  for_each = local.kinesisanalyticsv2_application_props

  kinesisanalyticsv2_application_description               = each.value.description
  kinesisanalyticsv2_application_name                      = each.value.name
  kinesisanalyticsv2_application_runtime_environment       = each.value.runtime_environment
  kinesisanalyticsv2_application_service_execution_role    = each.value.service_execution_role
  kinesisanalyticsv2_application_application_configuration = each.value.application_configuration

  depends_on = [
    module.streaming_artifacts_bucket,
    module.time_sleep,
  ]
}
