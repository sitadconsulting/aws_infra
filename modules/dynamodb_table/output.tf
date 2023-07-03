output "dynamodb_table_arn" {
  description = "ARN of the table"
  value       = element(concat(aws_dynamodb_table.dynamodb_table.*.arn, [""]), 0)
}
output "dynamodb_table_name" {
  description = "Name of the table"
  value       = element(concat(aws_dynamodb_table.dynamodb_table.*.id, [""]), 0)
}
output "dynamodb_table_replica_arn" {
  description = "ARN of the replica"
  value       = element(concat(aws_dynamodb_table.dynamodb_table.replica.*.arn, [""]), 0)
}
output "dynamodb_table_replica_stream_arn" {
  description = "ARN of the replica Table Stream. Only available when stream_enabled = true"
  value       = element(concat(aws_dynamodb_table.dynamodb_table.replica.*.stream_arn, [""]), 0)
}
output "dynamodb_table_replica_stream_label" {
  description = "Timestamp, in ISO 8601 format, for the replica stream. Only available when stream_enabled = true"
  value       = element(concat(aws_dynamodb_table.dynamodb_table.replica.*.stream_label, [""]), 0)
}
output "dynamodb_table_stream_arn" {
  description = "ARN of the Table Stream. Only available when stream_enabled = true"
  value       = element(concat(aws_dynamodb_table.dynamodb_table.*.stream_arn, [""]), 0)
}
output "dynamodb_table_stream_label" {
  description = "Timestamp, in ISO 8601 format, for this stream. Only available when stream_enabled = true"
  value       = element(concat(aws_dynamodb_table.dynamodb_table.*.stream_label, [""]), 0)
}
