resource "aws_glue_catalog_database" "glue_catalog_database" {
  catalog_id   = var.glue_catalog_database_catalog_id
  description  = var.glue_catalog_database_description
  location_uri = var.glue_catalog_database_location_uri
  name         = var.glue_catalog_database_name
  parameters   = var.glue_catalog_database_parameters
  tags         = var.glue_catalog_database_tags

  dynamic "create_table_default_permission" {
    for_each = var.glue_catalog_database_create_table_default_permission
      content {
        permissions = create_table_default_permission.value["permissions"]
        dynamic "principal" {
          for_each = create_table_default_permission.value.principal
            content {
              data_lake_principal_identifier = principal.value["data_lake_principal_identifier"]
            }
        }
      }
  }
  dynamic "target_database" {
    for_each = var.glue_catalog_database_target_database
      content {
        catalog_id    = target_database.value["catalog_id"]
        database_name = target_database.value["database_name"] 
      }
  }
  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }
}
