resource "aws_cloudwatch_log_account_policy" "cloudwatch_log_account_policy" {
  policy_document    = var.cloudwatch_log_account_policy_policy_document
  policy_type        = var.cloudwatch_log_account_policy_policy_type
  policy_name        = var.cloudwatch_log_account_policy_policy_name
  scope              = var.cloudwatch_log_account_policy_scope
  selection_criteria = var.cloudwatch_log_account_policy_selection_criteria
}
