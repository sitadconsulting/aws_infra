resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  log_group_name  = var.cloudwatch_log_group_log_group_name
  policy_document = var.cloudwatch_log_group_policy_document 
}
