output "rds_export_task_failure_cause" {
  description = "Reason the export failed, if it failed"
  value       = element(concat(aws_rds_export_task.rds_export_task.*.failure_cause, [""]), 0)
}
output "rds_export_task_id" {
  description = "Unique identifier for the snapshot export task"
  value       = element(concat(aws_rds_export_task.rds_export_task.*.id, [""]), 0)
}
output "rds_export_task_percent_progress" {
  description = "Progress of the snapshot export task as a percentage"
  value       = element(concat(aws_rds_export_task.rds_export_task.*.percent_progress, [""]), 0)
}
output "rds_export_task_snapshot_time" {
  description = "Time that the snapshot was created"
  value       = element(concat(aws_rds_export_task.rds_export_task.*.snapshot_time, [""]), 0)
}
output "rds_export_task_source_type" {
  description = "Type of source for the export"
  value       = element(concat(aws_rds_export_task.rds_export_task.*.source_type, [""]), 0)
}
output "rds_export_task_status" {
  description = "Status of the export task"
  value       = element(concat(aws_rds_export_task.rds_export_task.*.status, [""]), 0)
}
output "rds_export_task_task_end_time" {
  description = "Time that the snapshot export task completed"
  value       = element(concat(aws_rds_export_task.rds_export_task.*.task_end_time, [""]), 0)
}
output "rds_export_task_task_start_time" {
  description = "Time that the snapshot export task started"
  value       = element(concat(aws_rds_export_task.rds_export_task.*.task_start_time, [""]), 0)
}
output "rds_export_task_warning_message" {
  description = "Warning about the snapshot export task, if any"
  value       = element(concat(aws_rds_export_task.rds_export_task.*.warning_message, [""]), 0)
}
