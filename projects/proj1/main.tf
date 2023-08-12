terraform {
  required_version = ">= 1.3.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.7.0"
    }
    local = {
      source = "hashicorp/local"
      version = "~> 2.3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
    archive = {
      source = "hashicorp/archive"
      version = "2.4.0"
    }
  }
}
module "kinesis_stream" {
  source = "../../modules/kinesis_stream"

  for_each = local.kinesis_stream_props

  kinesis_stream_name             = each.value.name
  kinesis_stream_retention_period = each.value.retention_period
  kinesis_stream_shard_count      = each.value.shard_count
  kinesis_stream_tags             = each.value.tags
}
module "athena_query_result_s3_bucket" {
  source = "../../modules/s3_bucket"

  for_each = local.athena_query_result_s3_bucket_props

  s3_bucket_bucket = each.value.bucket
  s3_bucket_tags   = each.value.tags
}
module "s3_assets_bucket" {
  source = "../../modules/s3_bucket"

  for_each = local.s3_assets_bucket_props

  s3_bucket_bucket = each.value.bucket
  s3_bucket_tags   = each.value.tags
}
module "glue_service_iam_role" {
  source = "../../modules/iam_role"

  for_each = local.glue_service_iam_role_props

  iam_role_name               = each.value.name
  iam_role_description        = each.value.description
  iam_role_assume_role_policy = each.value.assume_role_policy
  iam_role_path               = each.value.path
  iam_role_tags               = each.value.tags
}
module "glue_developer_iam_group" {
  source = "../../modules/iam_group"

  for_each = local.glue_developer_iam_group_props
 
  iam_group_name = each.value.name
  iam_group_path = each.value.path
}
module "glue_service_iam_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.glue_service_iam_policy_attachment_props

  iam_role_policy_attachment_role        = each.value.role
  iam_role_policy_attachment_policy_arn  = each.value.policy_arn
}
module "glue_developer_iam_group_policy_attachment" {
  source = "../../modules/iam_group_policy_attachment"

  for_each = local.glue_developer_iam_group_policy_attachment_props

  iam_group_policy_attachment_group      = each.value.group
  iam_group_policy_attachment_policy_arn = each.value.policy_arn
}
module "glue_service_notebook_iam_role" {
  source = "../../modules/iam_role"

  for_each = local.glue_service_notebook_iam_role_props

  iam_role_name               = each.value.name
  iam_role_description        = each.value.description
  iam_role_assume_role_policy = each.value.assume_role_policy
  iam_role_path               = each.value.path
  iam_role_tags               = each.value.tags
}
module "glue_service_notebook_iam_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.glue_service_notebook_iam_policy_attachment_props

  iam_role_policy_attachment_role        = each.value.role
  iam_role_policy_attachment_policy_arn  = each.value.policy_arn
}
module "sagemaker_notebook_iam_role" {
  source = "../../modules/iam_role"

  for_each = local.sagemaker_notebook_iam_role_props

  iam_role_name               = each.value.name
  iam_role_description        = each.value.description
  iam_role_assume_role_policy = each.value.assume_role_policy
  iam_role_path               = each.value.path
  iam_role_tags               = each.value.tags
}
module "sagemaker_notebook_iam_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.sagemaker_notebook_iam_policy_attachment_props

  iam_role_policy_attachment_role        = each.value.role
  iam_role_policy_attachment_policy_arn  = each.value.policy_arn
}
module "athena_workgroup" {
  source = "../../modules/athena_workgroup"

  for_each = local.athena_workgroup_props

  athena_workgroup_description   = each.value.description
  athena_workgroup_name          = each.value.name
  athena_workgroup_state         = each.value.state
  athena_workgroup_configuration = each.value.configuration
}
module "s3_object" {
  source = "../../modules/s3_object"

  for_each = local.s3_object_props

  s3_object_bucket = each.value.bucket
  s3_object_key    = each.value.key 

  depends_on = [
    module.athena_query_result_s3_bucket,
    module.s3_assets_bucket,
  ]
}
module "s3_object_file_upload" {
  source = "../../modules/s3_object"

  for_each = local.s3_object_file_upload_props

  s3_object_bucket       = each.value.bucket
  s3_object_key          = each.value.key
  s3_object_content      = each.value.content
  s3_object_content_type = each.value.content_type

  depends_on = [
    module.s3_object,
  ]
}
module "s3_object_zipfile_upload" {
  source = "../../modules/s3_object"

  for_each = local.s3_object_zipfile_upload_props

  s3_object_bucket       = each.value.bucket
  s3_object_key          = each.value.key
  s3_object_source       = each.value.source
  s3_object_content_type = each.value.content_type

  depends_on = [
    module.s3_object,
  ]
}
module "gsw_iceberg_catalog_database" {
  source = "../../modules/glue_catalog_database"

  for_each = local.gsw_iceberg_catalog_database_props

  glue_catalog_database_description  = each.value.description
  glue_catalog_database_location_uri = each.value.location_uri
  glue_catalog_database_name         = each.value.name

  depends_on = [
    module.athena_query_result_s3_bucket,
    module.s3_object,
  ]
}
module "gsw_stream_registry" {
  source = "../../modules/glue_registry"

  for_each = local.gsw_stream_registry_props

  glue_registry_description   = each.value.description
  glue_registry_registry_name = each.value.registry_name
}
module "gsw_stream_schema" {
  source = "../../modules/glue_schema"

  for_each = local.gsw_stream_schema_props

  glue_schema_compatibility     = each.value.compatibility
  glue_schema_data_format       = each.value.data_format
  glue_schema_description       = each.value.description
  glue_schema_registry_arn      = each.value.registry_arn
  glue_schema_schema_name       = each.value.schema_name
  glue_schema_schema_definition = each.value.schema_definition
}
module "gsw_stream_registry_table" {
  source = "../../modules/glue_catalog_table"

  for_each = local.gsw_stream_registry_table_props

  glue_catalog_table_description        = each.value.description
  glue_catalog_table_database_name      = each.value.database_name
  glue_catalog_table_name               = each.value.name
  glue_catalog_table_storage_descriptor = each.value.storage_descriptor

  depends_on = [
    module.athena_query_result_s3_bucket,
    module.kinesis_stream,
  ]
}
module "gsw_stream_table" {
  source = "../../modules/glue_catalog_table"

  for_each = local.gsw_stream_table_props

  glue_catalog_table_description        = each.value.description
  glue_catalog_table_database_name      = each.value.database_name
  glue_catalog_table_name               = each.value.name
  glue_catalog_table_parameters         = each.value.parameters
  glue_catalog_table_retention          = each.value.retention
  glue_catalog_table_table_type         = each.value.table_type
  glue_catalog_table_storage_descriptor = each.value.storage_descriptor

  depends_on = [
    module.gsw_iceberg_catalog_database,
  ]
}
module "gsw_datagenerator_job" {
  source = "../../modules/glue_job"

  for_each = local.gsw_datagenerator_job_props

  glue_job_default_arguments = each.value.default_arguments
  glue_job_description       = each.value.description
  glue_job_execution_class   = each.value.execution_class
  glue_job_name              = each.value.name
  #glue_job_number_of_workers = each.value.number_of_workers
  glue_job_role_arn          = each.value.role_arn
  glue_job_glue_version      = each.value.glue_version
  #glue_job_worker_type       = each.value.worker_type
  glue_job_command           = each.value.command

  depends_on = [
    module.athena_query_result_s3_bucket,
  ]
}
module "gsw_create_iceberg_tables_job" {
  source = "../../modules/glue_job"

  for_each = local.gsw_create_iceberg_tables_job_props

  glue_job_default_arguments = each.value.default_arguments
  glue_job_description       = each.value.description
  glue_job_execution_class   = each.value.execution_class
  glue_job_name              = each.value.name
  glue_job_number_of_workers = each.value.number_of_workers
  glue_job_role_arn          = each.value.role_arn
  glue_job_glue_version      = each.value.glue_version
  glue_job_worker_type       = each.value.worker_type
  glue_job_command           = each.value.command

  depends_on = [
    module.athena_query_result_s3_bucket,
  ]
}
module "gsw_transform_job" {
  source = "../../modules/glue_job"

  for_each = local.gsw_transform_job_props

  glue_job_default_arguments = each.value.default_arguments
  glue_job_description       = each.value.description
  glue_job_execution_class   = each.value.execution_class
  glue_job_name              = each.value.name
  glue_job_number_of_workers = each.value.number_of_workers
  glue_job_role_arn          = each.value.role_arn
  glue_job_glue_version      = each.value.glue_version
  glue_job_worker_type       = each.value.worker_type
  glue_job_command           = each.value.command

  depends_on = [
    module.s3_assets_bucket,
  ]
}
module "lambda_service_iam_role" {
  source = "../../modules/iam_role"

  for_each = local.lambda_service_iam_role_props

  iam_role_name               = each.value.name
  iam_role_description        = each.value.description
  iam_role_assume_role_policy = each.value.assume_role_policy
  iam_role_path               = each.value.path
  iam_role_tags               = each.value.tags
}
module "lambda_service_iam_policy" {
  source = "../../modules/iam_policy"

   for_each = local.lambda_service_iam_policy_props

   iam_policy_name        = each.value.name
   iam_policy_description = each.value.description
   iam_policy_policy      = each.value.policy
   iam_policy_path        = each.value.path
   iam_policy_tags        = each.value.tags
}
module "lambda_service_iam_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.lambda_service_iam_policy_attachment_props

  iam_role_policy_attachment_role        = each.value.role
  iam_role_policy_attachment_policy_arn  = each.value.policy_arn
}
module "gsw_lambda_function" {
  source = "../../modules/lambda_function"

  for_each = local.gsw_lambda_function_props

  lambda_function_description       = each.value.description
  lambda_function_function_name     = each.value.function_name
  lambda_function_handler           = each.value.handler
  lambda_function_memory_size       = each.value.memory_size
  lambda_function_publish           = each.value.publish
  lambda_function_role              = each.value.role
  lambda_function_runtime           = each.value.runtime
  lambda_function_s3_bucket         = each.value.s3_bucket
  lambda_function_s3_key            = each.value.s3_key
  lambda_function_tags              = each.value.tags
  lambda_function_timeout           = each.value.timeout
  lambda_function_environment       = each.value.environment
  lambda_function_ephemeral_storage = each.value.ephemeral_storage

  depends_on = [
    module.athena_query_result_s3_bucket,
    module.s3_object_zipfile_upload,
  ]
}
