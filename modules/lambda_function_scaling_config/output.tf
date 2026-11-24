output "lambda_function_scaling_config_function_arn" {
  description = "ARN of the Lambda function"
  value       = element(concat(aws_lambda_function_scaling_config.lambda_function_scaling_config.*.function_arn, [""]), 0)
}
output "lambda_function_scaling_config_function_state" {
  description = "State of the function after the scaling configuration was applied. This reflects the state reported by the most recent create or update and is not refreshed on read"
  value       = element(concat(aws_lambda_function_scaling_config.lambda_function_scaling_config.*.function_state, [""]), 0)
}
