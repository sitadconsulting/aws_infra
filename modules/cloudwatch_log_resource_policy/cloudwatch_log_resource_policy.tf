resource "aws_cloudwatch_log_resource_policy" "cloudwatch_log_resource_policy" {
  policy_document = var.cloudwatch_log_resource_policy_policy_document
  policy_name     = var.cloudwatch_log_resource_policy_policy_name
}
