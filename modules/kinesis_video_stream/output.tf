output "kinesis_video_stream_arn" {
  description = "ARN specifying the Stream (same as id)"
  value       = element(concat(aws_kinesis_video_stream.kinesis_video_stream.*.arn, [""]), 0)
}
output "kinesis_video_stream_creation_time" {
  description = "Time stamp that indicates when the stream was created"
  value       = element(concat(aws_kinesis_video_stream.kinesis_video_stream.*.creation_time, [""]), 0)
}
output "kinesis_video_stream_id" {
  description = "Unique Stream ID"
  value       = element(concat(aws_kinesis_video_stream.kinesis_video_stream.*.id, [""]), 0)
}
output "kinesis_video_stream_version" {
  description = "Version of the stream"
  value       = element(concat(aws_kinesis_video_stream.kinesis_video_stream.*.version, [""]), 0)
}
