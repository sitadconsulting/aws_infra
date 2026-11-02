resource "aws_cloudwatch_log_storage_tier_policy" "cloudwatch_log_storage_tier_policy" {
  storage_tier = var.cloudwatch_log_storage_tier_policy_storage_tier
}
