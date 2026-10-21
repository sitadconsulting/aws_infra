resource "aws_lakeformation_opt_in" "lakeformation_opt_in" {
  dynamic "principal" {
    for_each = var.lakeformation_opt_in_principal
      content {
        data_lake_principal_identifier = principal.value["data_lake_principal_identifier"]
      }
  }
  dynamic "resource_data" {
    for_each = var.lakeformation_opt_in_resource_data
      content {
        dynamic "catalog" {
          for_each = resource_data.value.catalog
            content {
              id  = catalog.value["id"]
            }
        }
        dynamic "data_cells_filter" {
          for_each = resource_data.value.data_cells_filter
            content {
              database_name    = data_cells_filter.value["database_name"]
              name             = data_cells_filter.value["name"]
              table_catalog_id = data_cells_filter.value["table_catalog_id"]
              table_name       = data_cells_filter.value["table_name"]
            }
        }
        dynamic "data_location" {
          for_each = resource_data.value.data_location
            content {
              catalog_id   = data_location.value["catalog_id"]
              resource_arn = data_location.value["resource_arn"]
            }
        }
        dynamic "database" {
          for_each = resource_data.value.database
            content {
              catalog_id = database.value["catalog_id"]
              name       = database.value["name"]
            }
        }
        dynamic "lf_tag" {
          for_each =  resource_data.value.lf_tag
            content {
              catalog_id = lf_tag.value["catalog_id"]
              key        = lf_tag.value["key"]
              values     = lf_tag.value["values"]
            }
        }
        dynamic "lf_tag_expression" {
          for_each = resource_data.value.lf_tag_expression
            content {
              catalog_id = lf_tag_expression.value["catalog_id"]
              name       = lf_tag_expression.value["name"] 
            }
        }
        dynamic "lf_tag_policy" {
          for_each = resource_data.value.lf_tag_policy
            content {
              catalog_id      = lf_tag_policy.value["catalog_id"]
              expression      = lf_tag_policy.value["expression"]
              expression_name = lf_tag_policy.value["expression_name"]
              resource_type   = lf_tag_policy.value["resource_type"]
            }
        }
        dynamic "table" {
          for_each = resource_data.value.table
            content {
              catalog_id    = table.value["catalog_id"]
              database_name = table.value["database_name"]
              name          = table.value["name"]
              wildcard      = table.value["wildcard"]
            }
        }
        dynamic "table_with_columns" {
          for_each = resource_data.value.table_with_columns
            content {
              catalog_id    = table_with_columns.value["catalog_id"]
              column_names  = table_with_columns.value["column_names"]
              database_name = table_with_columns.value["database_name"]
              name          = table_with_columns.value["name"]
              dynamic "column_wildcard" {
                for_each = table_with_columns.value.column_wildcard
                  content {
                    excluded_column_names = column_wildcard.value["excluded_column_names"]
                  }
              } 
            }
        }
      }
  }
}
