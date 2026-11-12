output "dms_replication_task_replication_task_arn" {
  description = "ARN for the replication task"
  value       = element(concat(aws_dms_replication_task.dms_replication_task.*.replication_task_arn, [""]), 0)
}
output "dms_replication_task_status" {
  description = "Replication Task status"
  value       = element(concat(aws_dms_replication_task.dms_replication_task.*.status, [""]), 0)
}
