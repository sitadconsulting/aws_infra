output "kinesis_stream_arn" {
  description = "ARN specifying the stream (same as id)"
  value       = element(concat(aws_kinesis_stream.kinesis_stream.*.arn, [""]), 0)
}
output "kinesis_stream_id" {
  description = "Unique stream ID"
  value       = element(concat(aws_kinesis_stream.kinesis_stream.*.id, [""]), 0)
}
output "kinesis_stream_name" {
  description = "Unique stream name"
  value       = element(concat(aws_kinesis_stream.kinesis_stream.*.name, [""]), 0)
}
output "kinesis_stream_shard_count" {
  description = "Count of shards for this stream"
  value       = element(concat(aws_kinesis_stream.kinesis_stream.*.shard_count, [""]), 0)
}
