resource "aws_config_configuration_recorder_status" "config_configuration_recorder_status" {
  name       = var.config_configuration_recorder_status_name
  is_enabled = var.config_configuration_recorder_status_is_enabled
}
