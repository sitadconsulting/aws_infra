output "scheduler_schedule_group_arn" {
  description = "ARN of the schedule group"
  value       = element(concat(aws_scheduler_schedule_group.scheduler_schedule_group.*.arn, [""]), 0)
}
output "scheduler_schedule_group_creation_time" {
  description = "Time at which the schedule group was created"
  value       = element(concat(aws_scheduler_schedule_group.scheduler_schedule_group.*.creation_time, [""]), 0)
}
output "scheduler_schedule_group_id" {
  description = "Name of the schedule group"
  value       = element(concat(aws_scheduler_schedule_group.scheduler_schedule_group.*.id, [""]), 0)
}
output "scheduler_schedule_group_last_modification_date" {
  description = "Time at which the schedule group was last modified"
  value       = element(concat(aws_scheduler_schedule_group.scheduler_schedule_group.*.last_modification_date, [""]), 0)
}
output "scheduler_schedule_group_state" {
  description = "State of the schedule group. Can be ACTIVE or DELETING"
  value       = element(concat(aws_scheduler_schedule_group.scheduler_schedule_group.*.state, [""]), 0)
}
