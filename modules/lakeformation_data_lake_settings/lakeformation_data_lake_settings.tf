resource "aws_lakeformation_data_lake_settings" "lakeformation_data_lake_settings" {
  admins                                = var.lakeformation_data_lake_settings_admins
  allow_external_data_filtering         = var.lakeformation_data_lake_settings_allow_external_data_filtering
  allow_full_table_external_data_access = var.lakeformation_data_lake_settings_allow_full_table_external_data_access
  authorized_session_tag_value_list     = var.lakeformation_data_lake_settings_authorized_session_tag_value_list
  catalog_id                            = var.lakeformation_data_lake_settings_catalog_id
  external_data_filtering_allow_list    = var.lakeformation_data_lake_settings_external_data_filtering_allow_list
  parameters                            = var.lakeformation_data_lake_settings_parameters
  read_only_admins                      = var.lakeformation_data_lake_settings_read_only_admins
  trusted_resource_owners               = var.lakeformation_data_lake_settings_trusted_resource_owners


  dynamic "create_database_default_permissions" {
    for_each = var.lakeformation_data_lake_settings_create_database_default_permissions
      content {
        permissions = create_database_default_permissions.value["permissions"]
        principal   = create_database_default_permissions.value["principal"]
      }
  }
  dynamic "create_table_default_permissions" {
    for_each = var.lakeformation_data_lake_settings_create_table_default_permissions
      content {
        permissions = create_table_default_permissions.value["permissions"]
        principal   = create_table_default_permissions.value["principal"]      
      }
  }
}
