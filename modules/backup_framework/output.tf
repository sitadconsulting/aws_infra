output "backup_framework_arn" {
  description = "ARN of the backup framework"
  value       = element(concat(aws_backup_framework.backup_framework.*.arn, [""]), 0)
}
output "backup_framework_creation_time" {
  description = "Date and time that a framework is created, in Unix format and Coordinated Universal Time (UTC)"
  value       = element(concat(aws_backup_framework.backup_framework.*.creation_time, [""]), 0)
}
output "backup_framework_deployment_status" {
  description = "Deployment status of a framework. The statuses are: CREATE_IN_PROGRESS | UPDATE_IN_PROGRESS | DELETE_IN_PROGRESS | COMPLETED | FAILED"
  value       = element(concat(aws_backup_framework.backup_framework.*.deployment_status, [""]), 0)
}
output "backup_framework_id" {
  description = "ID of the backup framework"
  value       = element(concat(aws_backup_framework.backup_framework.*.id, [""]), 0)
}
output "backup_framework_status" {
  description = "Framework consists of one or more controls. Each control governs a resource, such as backup plans, backup selections, backup vaults, or recovery points. You can also turn AWS Config recording on or off for each resource"
  value       = element(concat(aws_backup_framework.backup_framework.*.status, [""]), 0)
}
