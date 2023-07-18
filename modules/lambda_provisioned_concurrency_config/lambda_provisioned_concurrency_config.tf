resource "aws_lambda_provisioned_concurrency_config" "lambda_provisioned_concurrency_config" {
  function_name                     = var.lambda_provisioned_concurrency_config_function_name
  provisioned_concurrent_executions = var.lambda_provisioned_concurrency_config_provisioned_concurrent_executions
  qualifier                         = var.lambda_provisioned_concurrency_config_qualifier
  skip_destroy                      = var.lambda_provisioned_concurrency_config_skip_destroy
}
