output "backup_plan_arn" {
  description = "ARN of the backup plan"
  value       = element(concat(aws_backup_plan.backup_plan.*.arn, [""]), 0)
}
output "backup_plan_id" {
  description = "ID of the backup plan"
  value       = element(concat(aws_backup_plan.backup_plan.*.id, [""]), 0)
}
output "backup_plan_version" {
  description = "Unique, randomly generated, Unicode, UTF-8 encoded string that serves as the version ID of the backup plan"
  value       = element(concat(aws_backup_plan.backup_plan.*.version, [""]), 0)
}
