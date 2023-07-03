output "dynamodb_table_replica_arn" {
  description = "ARN of the table replica"
  value       = element(concat(aws_dynamodb_table_replica.dynamodb_table_replica.*.arn, [""]), 0)
}
output "dynamodb_table_replica_id" {
  description = "Name of the table and region of the main global table joined with a semicolon (e.g., TableName:us-east-1)"
  value       = element(concat(aws_dynamodb_table_replica.dynamodb_table_replica.*.id, [""]), 0)
}
