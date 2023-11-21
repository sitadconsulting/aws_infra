output "efs_backup_policy_id" {
  description = "The ID that identifies the file system (e.g., fs-ccfc0d65)"
  value       = element(concat(aws_efs_backup_policy.efs_backup_policy.*.id, [""]), 0)
}
