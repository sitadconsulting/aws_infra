output "dynamodb_global_table_name" {
  description = "Name of the DynamoDB Global Table"
  value       = element(concat(aws_dynamodb_global_table.dynamodb_global_table.*.id, [""]), 0)
}
output "dynamodb_global_table_arn" {
  description = "ARN of the DynamoDB Global Table"
  value       = element(concat(aws_dynamodb_global_table.dynamodb_global_table.*.arn, [""]), 0)
}
