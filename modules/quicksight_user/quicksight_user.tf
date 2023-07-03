resource "aws_quicksight_user" "quicksight_user" {
  aws_account_id = var.quicksight_user_aws_account_id
  email          = var.quicksight_user_email
  iam_arn        = var.quicksight_user_iam_arn
  identity_type  = var.quicksight_user_identity_type
  namespace      = var.quicksight_user_namespace
  session_name   = var.quicksight_user_session_name
  user_name      = var.quicksight_user_user_name
  user_role      = var.quicksight_user_user_role
}
