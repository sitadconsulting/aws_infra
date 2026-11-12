resource "aws_dms_migration_project" "dms_migration_project" {
  description          = var.dms_migration_project_description
  instance_profile_arn = var.dms_migration_project_instance_profile_arn
  name                 = var.dms_migration_project_name
  tags                 = var.dms_migration_project_tags
  transformation_rules = var.dms_migration_project_transformation_rules

  dynamic "schema_conversion_application_attributes" {
    for_each = var.dms_migration_project_schema_conversion_application_attributes
      content {
        s3_bucket_path     = schema_conversion_application_attributes.value["s3_bucket_path"]
        s3_bucket_role_arn = schema_conversion_application_attributes.value["s3_bucket_role_arn"]
      }
  }
  dynamic "source_data_provider_descriptor" {
    for_each = var.dms_migration_project_source_data_provider_descriptor
      content {
        data_provider_arn               = source_data_provider_descriptor.value["data_provider_arn"]
        secrets_manager_access_role_arn = source_data_provider_descriptor.value["secrets_manager_access_role_arn"]
        secrets_manager_secret_id       = source_data_provider_descriptor.value["secrets_manager_secret_id"]
      }
  }
  dynamic "target_data_provider_descriptor" {
    for_each = var.dms_migration_project_target_data_provider_descriptor
      content {
        data_provider_arn               = target_data_provider_descriptor.value["data_provider_arn"]
        secrets_manager_access_role_arn = target_data_provider_descriptor.value["secrets_manager_access_role_arn"]
        secrets_manager_secret_id       = target_data_provider_descriptor.value["secrets_manager_secret_id"]
      }
  }

}
