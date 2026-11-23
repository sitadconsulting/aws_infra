resource "aws_iot_logging_options" "iot_logging_options" {
  default_log_level = var.iot_logging_options_default_log_level
  disable_all_logs  = var.iot_logging_options_disable_all_logs
  role_arn          = var.iot_logging_options_role_arn
}
