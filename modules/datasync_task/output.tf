output "datasync_task_arn" {
  description = "ARN of the DataSync Task"
  value       = element(concat(aws_datasync_task.datasync_task.*.arn, [""]), 0)
}
output "datasync_task_id" {
  description = "ARN of the DataSync Task"
  value       = element(concat(aws_datasync_task.datasync_task.*.id, [""]), 0)
}
