output "quicksight_refresh_schedule_arn" {
  description = "ARN of the refresh schedule"
  value       = element(concat(aws_quicksight_refresh_schedule.quicksight_refresh_schedule.*.arn, [""]), 0)
}
output "quicksight_refresh_schedule_id" {
  description = "A comma-delimited string joining AWS account ID, data set ID & refresh schedule ID"
  value       = element(concat(aws_quicksight_refresh_schedule.quicksight_refresh_schedule.*.id, [""]), 0)
}
