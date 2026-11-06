output "backup_restore_testing_plan_arn" {
  description = "ARN of the Restore Testing Plan"
  value       = element(concat(aws_backup_restore_testing_plan.backup_restore_testing_plan.*.arn, [""]), 0)
}
