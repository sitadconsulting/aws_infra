resource "aws_cloudwatch_log_subscription_filter" "cloudwatch_log_subscription_filter" {
  destination_arn = var.cloudwatch_log_subscription_filter_destination_arn
  distribution    = var.cloudwatch_log_subscription_filter_distribution
  filter_pattern  = var.cloudwatch_log_subscription_filter_filter_pattern
  log_group_name  = var.cloudwatch_log_subscription_filter_log_group_name
  name            = var.cloudwatch_log_subscription_filter_name
  role_arn        = var.cloudwatch_log_subscription_filter_role_arn
}
