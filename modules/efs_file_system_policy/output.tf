output "efs_file_system_policy_id" {
  description = "Filesystem ID (e.g., fs-ccfc0d65)"
  value       = element(concat(aws_efs_file_system_policy.efs_file_system_policy.*.id, [""]), 0)
}
