resource "aws_lakeformation_permissions" "lakeformation_permissions" {
  permissions                   = var.lakeformation_permissions_permissions
  principal                     = var.lakeformation_permissions_principal
  catalog_resource              = var.lakeformation_permissions_catalog_resource
  catalog_id                    = var.lakeformation_permissions_catalog_id
  permissions_with_grant_option = var.lakeformation_permissions_permissions_with_grant_option

  dynamic "data_cells_filter" {
    for_each = var.lakeformation_permissions_data_cells_filter
      content {
        database_name    = data_cells_filter.value["database_name"]
        name             = data_cells_filter.value["name"]
        table_catalog_id = data_cells_filter.value["table_catalog_id"]
        table_name       = data_cells_filter.value["table_name"]
      }
  }
  dynamic "data_location" {
    for_each = var.lakeformation_permissions_data_location
      content {
        arn        = data_location.value["arn"]
        catalog_id = data_location.value["catalog_id"] 
      }
  }
  dynamic "database" {
    for_each = var.lakeformation_permissions_database
      content {
        catalog_id = database.value["catalog_id"]
        name       = database.value["name"]
      }
  }
  dynamic "lf_tag" {
    for_each = var.lakeformation_permissions_lf_tag
      content {
        catalog_id = lf_tag.value["catalog_id"]
        key        = lf_tag.value["key"]
        values     = lf_tag.value["values"]
      }
  }
  dynamic "lf_tag_policy" {
    for_each = var.lakeformation_permissions_lf_tag_policy
      content {
        catalog_id    = lf_tag_policy.value["catalog_id"]
        resource_type = lf_tag_policy.value["resource_type"]
        dynamic "expression" {
          for_each = lf_tag_policy.value.expression
            content {
              key    = expression.value["key"]
              values = expression.value["values"]
            }
        }
      }
  }
  dynamic "table" {
    for_each = var.lakeformation_permissions_table
      content {
        catalog_id    = table.value["catalog_id"]
        database_name = table.value["database_name"]
        name          = table.value["name"]
        wildcard      = table.value["wildcard"]
      }
  }
  dynamic "table_with_columns" {
    for_each = var.lakeformation_permissions_table_with_columns
      content {
        catalog_id            = table_with_columns.value["catalog_id"]
        column_names          = table_with_columns.value["column_names"]
        database_name         = table_with_columns.value["database_name"]
        excluded_column_names = table_with_columns.value["excluded_column_names"]
        name                  = table_with_columns.value["name"]
        wildcard              = table_with_columns.value["wildcard"]
      }
  }
}
