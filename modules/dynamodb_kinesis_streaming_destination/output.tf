output "dynamodb_kinesis_streaming_destination_table_name_stream_arn" {
  description = "The table_name and stream_arn separated by a comma"
  value       = element(concat(aws_dynamodb_kinesis_streaming_destination.dynamodb_kinesis_streaming_destination.*.id, [""]), 0)
}
