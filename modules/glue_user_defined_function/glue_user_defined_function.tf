resource "aws_glue_user_defined_function" "glue_user_defined_function" {
  catalog_id    = var.glue_user_defined_function_catalog_id
  class_name    = var.glue_user_defined_function_class_name
  database_name = var.glue_user_defined_function_database_name
  name          = var.glue_user_defined_function_name
  owner_name    = var.glue_user_defined_function_owner_name
  owner_type    = var.glue_user_defined_function_owner_type

  dynamic "resource_uris" {
    for_each = var.glue_user_defined_function_resource_uris
      content {
        resource_type = resource_uris.value["resource_type"]
        uri           = resource_uris.value["uri"]
      }
  }
}
