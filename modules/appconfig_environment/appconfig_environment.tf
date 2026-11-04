resource "aws_appconfig_environment" "appconfig_environment" {
  application_id = var.appconfig_environment_application_id
  description    = var.appconfig_environment_description
  name           = var.appconfig_environment_name
  tags           = var.appconfig_environment_tags

  dynamic "monitor" {
    for_each = var.appconfig_environment_monitor
      content {
        alarm_arn      = monitor.value["alarm_arn"]
        alarm_role_arn = monitor.value["alarm_role_arn"]
      }
  }
}
