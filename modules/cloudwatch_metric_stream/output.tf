output "cloudwatch_metric_stream_arn" {
  description = "ARN of the metric stream"
  value       = element(concat(aws_cloudwatch_metric_stream.cloudwatch_metric_stream.*.arn, [""]), 0)
}
output "cloudwatch_metric_stream_creation_date" {
  description = "Date and time in RFC3339 format that the metric stream was created"
  value       = element(concat(aws_cloudwatch_metric_stream.cloudwatch_metric_stream.*.creation_date, [""]), 0)
}
output "cloudwatch_metric_stream_last_update_date" {
  description = "Date and time in RFC3339 format that the metric stream was last updated"
  value       = element(concat(aws_cloudwatch_metric_stream.cloudwatch_metric_stream.*.last_update_date, [""]), 0)
}
output "cloudwatch_metric_stream_state" {
  description = "State of the metric stream. Possible values are running and stopped"
  value       = element(concat(aws_cloudwatch_metric_stream.cloudwatch_metric_stream.*.state, [""]), 0)
}
