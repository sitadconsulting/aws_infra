resource "aws_lambda_function_recursion_config" "lambda_function_recursion_config" {
  function_name  = var.lambda_function_recursion_config_function_name
  recursive_loop = var.lambda_function_recursion_config_recursive_loop
}
