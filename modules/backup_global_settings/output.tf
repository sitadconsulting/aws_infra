output "backup_global_settings_id" {
  description = "AWS Account ID"
  value       = element(concat(aws_backup_global_settings.backup_global_settings.*.id, [""]), 0)
}
