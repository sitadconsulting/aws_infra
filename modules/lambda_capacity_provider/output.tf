output "lambda_capacity_provider_arn" {
  description = "ARN of the Capacity Provider"
  value       = element(concat(aws_lambda_capacity_provider.lambda_capacity_provider.*.arn, [""]), 0)
}
