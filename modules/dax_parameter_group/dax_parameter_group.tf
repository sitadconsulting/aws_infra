resource "aws_dax_parameter_group" "dax_parameter_group" {
  description = var.dax_parameter_group_description
  name        = var.dax_parameter_group_name

  dynamic "parameters" {
    for_each = var.dax_parameter_group_parameters
      content {
        name  = parameters.value["name"]
        value = parameters.value["value"]
      }
  }
}
