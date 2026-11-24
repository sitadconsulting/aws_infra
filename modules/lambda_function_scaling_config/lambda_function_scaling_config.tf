resource "aws_lambda_function_scaling_config" "lambda_function_scaling_config" {
  function_name = var.lambda_function_scaling_config_function_name
  qualifier     = var.lambda_function_scaling_config_qualifier

  dynamic "function_scaling_config" {
    for_each = var.lambda_function_scaling_config_function_scaling_config
      content {
        max_execution_environments = function_scaling_config.value["max_execution_environments"]
        min_execution_environments = function_scaling_config.value["min_execution_environments"]
      }
  }
}
