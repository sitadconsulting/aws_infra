output "backup_report_plan_arn" {
  description = "ARN of the backup report plan"
  value       = element(concat(aws_backup_report_plan.backup_report_plan.*.arn, [""]), 0)
}
output "backup_report_plan_creation_time" {
  description = "Date and time that a report plan is created, in Unix format and Coordinated Universal Time (UTC)"
  value       = element(concat(aws_backup_report_plan.backup_report_plan.*.creation_time, [""]), 0)
}
output "backup_report_plan_deployment_status" {
  description = "Deployment status of a report plan. The statuses are: CREATE_IN_PROGRESS | UPDATE_IN_PROGRESS | DELETE_IN_PROGRESS | COMPLETED"
  value       = element(concat(aws_backup_report_plan.backup_report_plan.*.deployment_status, [""]), 0)
}
output "backup_report_plan_id" {
  description = "ID of the backup report plan"
  value       = element(concat(aws_backup_report_plan.backup_report_plan.*.id, [""]), 0)
}
