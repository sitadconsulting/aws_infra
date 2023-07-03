resource "aws_cloudwatch_log_destination_policy" "cloudwatch_log_destination_policy" {
  access_policy    = var.cloudwatch_log_destination_policy_access_policy
  destination_name = var.cloudwatch_log_destination_policy_destination_name
  force_update     = var.cloudwatch_log_destination_policy_force_update
}
