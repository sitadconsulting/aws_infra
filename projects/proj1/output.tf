#############################
# Kinesis Resources outputs
#############################
output "kinesis_stream_id" {
  description = "The unique Stream id"
  value       = { for k in sort(keys(local.kinesis_stream_props)) : k => module.kinesis_stream[k].kinesis_stream_id }
}
output "kinesis_stream_name" {
  description = "The unique Stream name"
  value       = { for k in sort(keys(local.kinesis_stream_props)) : k => module.kinesis_stream[k].kinesis_stream_name }
}
output "kinesis_stream_arn" {
  description = "The Amazon Resource Name (ARN) specifying the Stream (same as id)"
  value       = { for k in sort(keys(local.kinesis_stream_props)) : k => module.kinesis_stream[k].kinesis_stream_arn }
}
###############################
# S3 Bucket Resources outputs
###############################
output "athena_query_result_s3_bucket_id" {
  description = "The name of the bucket"
  value       = { for k in sort(keys(local.athena_query_result_s3_bucket_props)) : k => module.athena_query_result_s3_bucket[k].s3_bucket_id }
}
output "athena_query_result_s3_bucket_arn" {
  description = "ARN of the bucket"
  value       = { for k in sort(keys(local.athena_query_result_s3_bucket_props)) : k => module.athena_query_result_s3_bucket[k].s3_bucket_arn }
}
output "s3_assets_bucket_id" {
  description = "The name of the bucket"
  value       = { for k in sort(keys(local.s3_assets_bucket_props)) : k => module.s3_assets_bucket[k].s3_bucket_id }
}
output "s3_assets_bucket_arn" {
  description = "ARN of the bucket"
  value       = { for k in sort(keys(local.s3_assets_bucket_props)) : k => module.s3_assets_bucket[k].s3_bucket_arn }
}
################################
# Glue service iam role outputs
################################
output "glue_service_iam_role_name" {
  description = "Glue service iam role name"
  value       = [ for k in sort(keys(local.glue_service_iam_role_props)) :  module.glue_service_iam_role[k].iam_role_name ]
}
output "glue_service_iam_role_arn" {
  description = "ARN of Glue service iam role"
  value       = [ for k in sort(keys(local.glue_service_iam_role_props)) :  module.glue_service_iam_role[k].iam_role_arn ]
}
#########################
# Glue iam group outputs
#########################
output "glue_developer_iam_group_name" {
  description = "Glue iam group name"
  value       = [ for k in sort(keys(local.glue_developer_iam_group_props)) :  module.glue_developer_iam_group[k].iam_group_name ]
}
output "glue_developer_iam_group_arn" {
  description = "ARN of Glue iam group name"
  value       = [ for k in sort(keys(local.glue_developer_iam_group_props)) :  module.glue_developer_iam_group[k].iam_group_arn ]
}
##########################################
# Glue service notebook iam role outputs
#########################################
output "glue_serice_notebook_iam_role_name" {
  description = "Glue service notebook iam role name"
  value       = [ for k in sort(keys(local.glue_service_notebook_iam_role_props)) :  module.glue_service_notebook_iam_role[k].iam_role_name ]
}
output "glue_service_notebook_iam_role_arn" {
  description = "ARN of Glue service notebook iam role"
  value       = [ for k in sort(keys(local.glue_service_notebook_iam_role_props)) :  module.glue_service_notebook_iam_role[k].iam_role_arn ]
}
##########################################
# Sagemaker notebook iam role outputs
#########################################
output "sagemaker_notebook_iam_role_name" {
  description = "Sagemaker notebook iam role name"
  value       = [ for k in sort(keys(local.sagemaker_notebook_iam_role_props)) :  module.sagemaker_notebook_iam_role[k].iam_role_name ]
}
output "sagemaker_notebook_iam_role_arn" {
  description = "ARN of sagemaker notebook iam role"
  value       = [ for k in sort(keys(local.sagemaker_notebook_iam_role_props)) :  module.sagemaker_notebook_iam_role[k].iam_role_arn ]
}
##########################################
# Athena work group  outputs
#########################################
output "athena_workgroup_arn" {
  description = "ARN of the workgroup"
  value       = [ for k in sort(keys(local.athena_workgroup_props)) :  module.athena_workgroup[k].athena_workgroup_arn ]
}
output "athena_workgroup_configuration" {
  description = "Workgroup configuration settings"
  value       = [ for k in sort(keys(local.athena_workgroup_props)) :  module.athena_workgroup[k].athena_workgroup_configuration ]
}
output "athena_workgroup_id" {
  description = "Workgroup name"
  value       = [ for k in sort(keys(local.athena_workgroup_props)) :  module.athena_workgroup[k].athena_workgroup_id ]
}
##########################################
# Glue catalog database resource  outputs
##########################################
output "gsw_iceberg_glue_catalog_database_arn" {
  description = "ARN of the Glue Catalog Database"
  value       = [ for k in sort(keys(local.gsw_iceberg_catalog_database_props)) : module.gsw_iceberg_catalog_database[k].glue_catalog_database_arn ]
}
output "gsw_iceberg_glue_catalog_database_id" {
  description = "Catalog ID and name of the database"
  value       = [ for k in sort(keys(local.gsw_iceberg_catalog_database_props)) : module.gsw_iceberg_catalog_database[k].glue_catalog_database_id ]
}
###################################
## Glue registry resource  outputs
###################################
output "gsw_stream_glue_registry_arn" {
  description = "ARN of Glue Registry"
  value       = [ for k in sort(keys(local.gsw_stream_registry_props)) : module.gsw_stream_registry[k].glue_registry_arn ]
}
##################################
## Glue Schema resource  outputs
##################################
output "gsw_stream_glue_schema_arn" {
  description = "ARN of the schema"
  value       = [ for k in sort(keys(local.gsw_stream_schema_props)) : module.gsw_stream_schema[k].glue_schema_arn ]
}
################################################
## Glue stream registry table resource  outputs
################################################
output "gsw_stream_registry_catalog_table_arn" {
  description = "ARN of the Glue Table"
  value       = [ for k in sort(keys(local.gsw_stream_registry_table_props)) : module.gsw_stream_registry_table[k].glue_catalog_table_arn ]
}
output "gsw_stream_registry_catalog_table_id" {
  description = "Catalog ID, Database name and name of the table"
  value       = [ for k in sort(keys(local.gsw_stream_registry_table_props)) : module.gsw_stream_registry_table[k].glue_catalog_table_id ]
}
#######################################
## Glue stream table resource  outputs
#######################################
output "gsw_stream_catalog_table_arn" {
  description = "ARN of the Glue Table"
  value       = [ for k in sort(keys(local.gsw_stream_table_props)) : module.gsw_stream_table[k].glue_catalog_table_arn ]
}
output "gsw_stream_catalog_table_id" {
  description = "Catalog ID, Database name and name of the table"
  value       = [ for k in sort(keys(local.gsw_stream_table_props)) : module.gsw_stream_table[k].glue_catalog_table_id ]
}
#############################################
## Glue datagenerator job resource  outputs
############################################
output "gsw_datagenerator_glue_job_arn" {
  description = "ARN of the Glue Job"
  value       = [ for k in sort(keys(local.gsw_datagenerator_job_props)) : module.gsw_datagenerator_job[k].glue_job_arn ]
}
output "gsw_datagenerator_glue_job_id" {
  description = "Glue Job Name"
  value       = [ for k in sort(keys(local.gsw_datagenerator_job_props)) : module.gsw_datagenerator_job[k].glue_job_id ]
}
###################################################
## Create iceberg tables job resource  outputs
###################################################
output "gsw_create_iceberg_table_glue_job_arn" {
  description = "ARN of the Glue Job"
  value       = [ for k in sort(keys(local.gsw_create_iceberg_tables_job_props)) : module.gsw_create_iceberg_tables_job[k].glue_job_arn ]
}
output "gsw_create_iceberg_table_glue_job_id" {
  description = "Glue Job Name"
  value       = [ for k in sort(keys(local.gsw_create_iceberg_tables_job_props)) : module.gsw_create_iceberg_tables_job[k].glue_job_id ]
}
###################################################
## gsw transform job resource  outputs
###################################################
output "gsw_transform_job_arn" {
  description = "ARN of the Glue Job"
  value       = [ for k in sort(keys(local.gsw_transform_job_props)) : module.gsw_transform_job[k].glue_job_arn ]
}
output "gsw_transform_job_id" {
  description = "Glue Job Name"
  value       = [ for k in sort(keys(local.gsw_transform_job_props)) : module.gsw_transform_job[k].glue_job_id ]
}
###################################
## Lambda service iam role outputs
###################################
output "lambda_service_iam_role_name" {
  description = "Lambda service iam role name"
  value       = [ for k in sort(keys(local.lambda_service_iam_role_props)) :  module.lambda_service_iam_role[k].iam_role_name ]
}
output "lambda_service_iam_role_arn" {
  description = "ARN of lambda iam role"
  value       = [ for k in sort(keys(local.lambda_service_iam_role_props)) :  module.lambda_service_iam_role[k].iam_role_arn ]
}
#####################################
## Lambda service Iam policy outputs
#####################################
output "lambda_service_iam_policy" {
  description = "ARN of lambda service policy"
  value       = { for k in sort(keys(local.lambda_service_iam_policy_props)) : k => module.lambda_service_iam_policy[k].iam_policy_arn }
}
###################################
## Lambda function outputs
###################################
output "gsw_lambda_function_arn" {
  description = "ARN of Lambda Function"
  value       = { for k in sort(keys(local.gsw_lambda_function_props)) : k => module.gsw_lambda_function[k].lambda_function_arn }
}
output "gsw_lambda_function_version" {
  description = "Latest published version of Lambda Function"
  value       = { for k in sort(keys(local.gsw_lambda_function_props)) : k => module.gsw_lambda_function[k].lambda_function_version }
}
