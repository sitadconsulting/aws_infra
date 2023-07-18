output "lambda_invocation_result" {
  description = "String result of the lambda function invocation"
  value       = element(concat(aws_lambda_invocation.lambda_invocation.*.result, [""]), 0)
}
