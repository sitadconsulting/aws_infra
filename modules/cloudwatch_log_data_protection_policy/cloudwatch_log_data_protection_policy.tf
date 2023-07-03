resource "aws_cloudwatch_log_data_protection_policy" "cloudwatch_log_data_protection_policy" {
  log_group_name  = var.cloudwatch_log_data_protection_policy_log_group_name
  policy_document = var.cloudwatch_log_data_protection_policy_policy_document
}
