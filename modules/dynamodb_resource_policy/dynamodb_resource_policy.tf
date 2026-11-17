resource "aws_dynamodb_resource_policy" "dynamodb_resource_policy" {
  resource_arn                        = var.dynamodb_resource_policy_resource_arn
  policy                              = var.dynamodb_resource_policy_policy
  confirm_remove_self_resource_access = var.dynamodb_resource_policy_confirm_remove_self_resource_access
}
