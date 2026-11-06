output "backup_region_settings_id" {
  description = "Backup setting region ID"
  value       = element(concat(aws_backup_region_settings.backup_region_settings.*.id, [""]), 0)
}
