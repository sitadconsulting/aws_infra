resource "aws_config_retention_configuration" "config_retention_configuration" {
  retention_period_in_days = var.config_retention_configuration_retention_period_in_days
}
