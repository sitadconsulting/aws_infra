resource "aws_config_remediation_configuration" "config_remediation_configuration" {
  automatic                  = var.config_remediation_configuration_automatic
  config_rule_name           = var.config_remediation_configuration_config_rule_name
  maximum_automatic_attempts = var.config_remediation_configuration_maximum_automatic_attempts 
  resource_type              = var.config_remediation_configuration_resource_type
  retry_attempt_seconds      = var.config_remediation_configuration_retry_attempt_seconds
  target_id                  = var.config_remediation_configuration_target_id
  target_type                = var.config_remediation_configuration_target_type
  target_version             = var.config_remediation_configuration_target_version

  dynamic "execution_controls" {
    for_each = var.config_remediation_configuration_execution_controls
      content {
        dynamic "ssm_controls" {
          for_each = execution_controls.value.ssm_controls
            content {
              concurrent_execution_rate_percentage = ssm_controls.value["concurrent_execution_rate_percentage"]
              error_percentage                     = ssm_controls.value["error_percentage"]
            }
        }
      }
  }
  dynamic "parameter" {
    for_each = var.config_remediation_configuration_parameter
      content {
        name           = parameter.value["name"]
        resource_value = parameter.value["resource_value"]
        static_value   = parameter.value["static_value"]
        static_values  = parameter.value["static_values"]
      }

  }
}
