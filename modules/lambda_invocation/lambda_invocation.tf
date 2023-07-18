resource "aws_lambda_invocation" "lambda_invocation" {
  function_name   = var.lambda_invocation_function_name
  input           = var.lambda_invocation_input
  lifecycle_scope = var.lambda_invocation_lifecycle_scope
  qualifier       = var.lambda_invocation_qualifier
  terraform_key   = var.lambda_invocation_terraform_key
  triggers        = var.lambda_invocation_triggers
}
