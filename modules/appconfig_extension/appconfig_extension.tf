resource "aws_appconfig_extension" "appconfig_extension" {
  description = var.appconfig_extension_description
  name        = var.appconfig_extension_name
  tags        = var.appconfig_extension_tags


  dynamic "action_point" {
    for_each = var.appconfig_extension_action_point
      content {
        point = action_point.value["point"]
        dynamic "action" {
          for_each = action_point.value.action
            content {
              description = action.value["description"]
              name        = action.value["name"]
              role_arn    = action.value["role_arn"]
              uri         = action.value["uri"]
            } 
        }
      }
  }
  dynamic "parameter" {
    for_each = var.appconfig_extension_parameter
      content {
        description = parameter.value["description"]
        name        = parameter.value["name"]
        required    = parameter.value["required"]
      }
  }
}
