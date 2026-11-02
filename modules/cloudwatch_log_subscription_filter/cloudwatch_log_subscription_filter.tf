resource "aws_cloudwatch_log_subscription_filter" "cloudwatch_log_subscription_filter" {
  apply_on_transformed_logs = var.cloudwatch_log_subscription_filter_apply_on_transformed_logs
  destination_arn           = var.cloudwatch_log_subscription_filter_destination_arn
  distribution              = var.cloudwatch_log_subscription_filter_distribution
  emit_system_fields        = var.cloudwatch_log_subscription_filter_emit_system_fields
  filter_pattern            = var.cloudwatch_log_subscription_filter_filter_pattern
  log_group_name            = var.cloudwatch_log_subscription_filter_log_group_name
  name                      = var.cloudwatch_log_subscription_filter_name
  role_arn                  = var.cloudwatch_log_subscription_filter_role_arn
}
