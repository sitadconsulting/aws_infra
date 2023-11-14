resource "aws_cognito_user_in_group" "cognito_user_in_group" {
  group_name   = var.cognito_user_in_group_group_name
  user_pool_id = var.cognito_user_in_group_user_pool_id
  username     = var.cognito_user_in_group_username
}
