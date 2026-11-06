output "backup_selection_id" {
  description = "Backup Selection identifier"
  value       = element(concat(aws_backup_selection.backup_selection.*.id, [""]), 0)
}
