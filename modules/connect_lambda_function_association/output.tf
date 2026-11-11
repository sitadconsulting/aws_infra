output "connect_lambda_function_association_id" {
  description = "The Amazon Connect instance ID and Lambda Function ARN separated by a comma (,)"
  value       = element(concat(aws_connect_lambda_function_association.connect_lambda_function_association.*.id, [""]), 0)
}
