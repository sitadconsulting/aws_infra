output "cloudwatch_log_stream_arn" {
  description = "ARN specifying the log stream"
  value       = element(concat(aws_cloudwatch_log_stream.cloudwatch_log_stream.*.arn, [""]), 0)
}
