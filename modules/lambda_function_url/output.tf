output "lambda_function_url_function_arn" {
  description = "ARN of the function"
  value       = element(concat(aws_lambda_function_url.lambda_function_url.*.function_arn, [""]), 0)
}
output "lambda_function_url_function_url" {
  description = "The HTTP URL endpoint for the function in the format https://<url_id>.lambda-url.<region>.on.aws"
  value       = element(concat(aws_lambda_function_url.lambda_function_url.*.function_url, [""]), 0)
}
