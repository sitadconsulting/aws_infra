resource "aws_cognito_user_group" "cognito_user_group" {
  description  = var.cognito_user_group_description
  name         = var.cognito_user_group_name
  precedence   = var.cognito_user_group_precedence
  role_arn     = var.cognito_user_group_role_arn
  user_pool_id = var.cognito_user_group_user_pool_id
}
