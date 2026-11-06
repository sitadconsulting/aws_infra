resource "aws_backup_framework" "backup_framework" {
  description = var.backup_framework_description
  name        = var.backup_framework_name
  tags        = var.backup_framework_tags

  dynamic "control" {
    for_each = var.backup_framework_control
      content {
        name  = control.value["name"]
        dynamic "input_parameter" {
          for_each = control.value.input_parameter
            content {
              name  = input_parameter.value["name"]
              value = input_parameter.value["value"]
            }
        }
        dynamic "scope" {
          for_each = control.value.scope
            content {
              compliance_resource_ids   = scope.value["compliance_resource_ids"]
              compliance_resource_types = scope.value["compliance_resource_types"]
              tags                      = scope.value["tags"]
            }
        }
      }
  }
}
