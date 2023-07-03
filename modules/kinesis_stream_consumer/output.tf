output "kinesis_stream_consumer_arn" {
  description = "ARN of the stream consumer"
  value       = element(concat(aws_kinesis_stream_consumer.kinesis_stream_consumer.*.arn, [""]), 0)
}
output "kinesis_stream_consumer_creation_timestamp" {
  description = "Approximate timestamp in RFC3339 format of when the stream consumer was created"
  value       = element(concat(aws_kinesis_stream_consumer.kinesis_stream_consumer.*.creation_timestamp, [""]), 0)
}
output "kinesis_stream_consumer_id" {
  description = "ARN of the stream consumer"
  value       = element(concat(aws_kinesis_stream_consumer.kinesis_stream_consumer.*.id, [""]), 0)
}
