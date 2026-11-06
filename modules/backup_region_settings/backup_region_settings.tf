resource "aws_backup_region_settings" "backup_region_settings" {
  resource_type_management_preference = var.backup_region_settings_resource_type_management_preference
  resource_type_opt_in_preference     = var.backup_region_settings_resource_type_opt_in_preference
}
