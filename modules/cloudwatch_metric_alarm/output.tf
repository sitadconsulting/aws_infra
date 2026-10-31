output "cloudwatch_metric_alarm_arn" {
  description = "The ARN of the CloudWatch Metric Alarm"
  value       = element(concat(aws_cloudwatch_metric_alarm.cloudwatch_metric_alarm.*.arn, [""]), 0)
}
output "cloudwatch_metric_alarm_id" {
  description = "The ID of the health check"
  value       = element(concat(aws_cloudwatch_metric_alarm.cloudwatch_metric_alarm.*.id, [""]), 0)
}
