output "glue_data_catalog_encryption_settings_id" {
  description = "The ID of the Data Catalog to set the security configuration for"
  value       = element(concat(aws_glue_data_catalog_encryption_settings.glue_data_catalog_encryption_settings.*.id, [""]), 0)
}
