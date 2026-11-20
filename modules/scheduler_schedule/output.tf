output "cloudwatch_event_rule_arn" {
  description = "ARN of the schedule"
  value       = element(concat(aws_scheduler_schedule.scheduler_schedule.*.arn, [""]), 0)
}
output "cloudwatch_event_rule_id" {
  description = "Name of the schedule"
  value       = element(concat(aws_scheduler_schedule.scheduler_schedule.*.id, [""]), 0)
}
