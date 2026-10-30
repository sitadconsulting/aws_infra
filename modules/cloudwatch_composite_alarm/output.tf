output "cloudwatch_composite_alarm_arn" {
  description = "The ARN of the composite alarm"
  value       = element(concat(aws_cloudwatch_composite_alarm.cloudwatch_composite_alarm.*.arn, [""]), 0)
}
output "cloudwatch_composite_alarm_id" {
  description = "The ID of the composite alarm resource, which is equivalent to its alarm_name"
  value       = element(concat(aws_cloudwatch_composite_alarm.cloudwatch_composite_alarm.*.id, [""]), 0)
}
