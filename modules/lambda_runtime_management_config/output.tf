output "lambda_runtime_management_config_function_arn" {
  description = "ARN of the function"
  value       = element(concat(aws_lambda_runtime_management_config.lambda_runtime_management_config.*.function_arn, [""]), 0)
}
