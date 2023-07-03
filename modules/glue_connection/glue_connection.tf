resource "aws_glue_connection" "glue_connection" {
  catalog_id            = var.glue_connection_catalog_id
  connection_properties = var.glue_connection_connection_properties
  connection_type       = var.glue_connection_connection_type
  description           = var.glue_connection_description
  match_criteria        = var.glue_connection_match_criteria
  name                  = var.glue_connection_name
  tags                  = var.glue_connection_tags
  
  dynamic "physical_connection_requirements" {
    for_each = var.glue_connection_physical_connection_requirements
      content {
        availability_zone      = physical_connection_requirements.value["availability_zone"]
        security_group_id_list = physical_connection_requirements.value["security_group_id_list"]
        subnet_id              = physical_connection_requirements.value["subnet_id"]
      }
  }
}
