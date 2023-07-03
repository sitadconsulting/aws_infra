resource "aws_redshift_parameter_group" "redshift_parameter_group" {
  description = var.redshift_parameter_group_description
  family      = var.redshift_parameter_group_family
  name        = var.redshift_parameter_group_name
  tags        = var.redshift_parameter_group_tags

  dynamic "parameter" {
    for_each = var.redshift_parameter_group_parameter
      content {
        name  = parameter.value["name"]
        value = parameter.value["value"]
      }
  }
}
