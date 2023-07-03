output "kinesis_stream_id" {
  description = "The unique Stream id"
  value       = element(concat(aws_kinesis_stream.kinesis_stream.*.id, [""]), 0)
}
output "kinesis_stream_name" {
  description = "The unique Stream name"
  value       = element(concat(aws_kinesis_stream.kinesis_stream.*.name, [""]), 0)
}
output "kinesis_stream_shard_count" {
  description = "The count of Shards for this Stream"
  value       = element(concat(aws_kinesis_stream.kinesis_stream.*.shard_count, [""]), 0)
}
output "kinesis_stream_arn" {
  description = "The Amazon Resource Name (ARN) specifying the Stream (same as id)"
  value       = element(concat(aws_kinesis_stream.kinesis_stream.*.arn, [""]), 0)
}
