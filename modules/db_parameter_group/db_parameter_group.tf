resource "aws_db_parameter_group" "db_parameter_group" {
  name        = var.db_parameter_group_name
  name_prefix = var.db_parameter_group_name_prefix
  family      = var.db_parameter_group_family
  description = var.db_parameter_group_description
  parameter   = var.db_parameter_group_paramter
  tags        = var.db_parameter_group_tags

  dynamic "parameter" {
    for_each = var.db_parameter_group_parameter
      content {
        apply_method = parameter.value["apply_method"] 
        name         = parameter.value["name"]
        value        = parameter.value["value"]
      }
  }
  lifecycle {
    create_before_destroy = true
  }
}
