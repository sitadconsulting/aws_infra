output "dynamodb_global_secondary_index_arn" {
  description = "ARN of the GSI"
  value       = element(concat(aws_dynamodb_global_secondary_index.dynamodb_global_secondary_index.*.arn, [""]), 0)
}
