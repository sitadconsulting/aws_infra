resource "aws_lambda_runtime_management_config" "lambda_runtime_management_config" {
  function_name       = var.lambda_runtime_management_config_function_name
  qualifier           = var.lambda_runtime_management_config_qualifier
  runtime_version_arn = var.lambda_runtime_management_config_runtime_version_arn
  update_runtime_on   = var.lambda_runtime_management_config_update_runtime_on
}
