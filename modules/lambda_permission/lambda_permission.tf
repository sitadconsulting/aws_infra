resource "aws_lambda_permission" "lambda_permission" {
  action                   = var.lambda_permission_action
  event_source_token       = var.lambda_permission_event_source_token
  function_name            = var.lambda_permission_function_name
  function_url_auth_type   = var.lambda_permission_function_url_auth_type
  invoked_via_function_url = var.lambda_permission_invoked_via_function_url
  principal                = var.lambda_permission_principal
  principal_org_id         = var.lambda_permission_principal_org_id
  qualifier                = var.lambda_permission_qualifier
  source_account           = var.lambda_permission_source_account
  source_arn               = var.lambda_permission_source_arn
  statement_id             = var.lambda_permission_statement_id
  statement_id_prefix      = var.lambda_permission_statement_id_prefix
}
