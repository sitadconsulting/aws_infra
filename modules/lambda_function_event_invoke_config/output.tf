output "lambda_function_event_invoke_config_id" {
  description = "Fully qualified Lambda Function name or ARN"
  value       = element(concat(aws_lambda_function_event_invoke_config.lambda_function_event_invoke_config.*.id, [""]), 0)
}
