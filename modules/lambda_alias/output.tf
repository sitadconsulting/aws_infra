output "lambda_alias_arn" {
  description = "ARN of the Lambda function alias"
  value       = element(concat(aws_lambda_alias.lambda_alias.*.arn, [""]), 0)
}
output "lambda_alias_invoke_arn" {
  description = "ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri"
  value       = element(concat(aws_lambda_alias.lambda_alias.*.invoke_arn, [""]), 0)
}
