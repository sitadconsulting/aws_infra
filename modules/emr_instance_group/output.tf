output "emr_instance_group_id" {
  description = "The EMR Instance ID"
  value       = element(concat(aws_emr_instance_group.emr_instance_group.*.id, [""]), 0)
}
output "emr_instance_group_running_instance_count" {
  description = "The number of instances currently running in this instance group"
  value       = element(concat(aws_emr_instance_group.emr_instance_group.*.running_instance_count, [""]), 0)
}
output "emr_instance_group_status" {
  description = "The current status of the instance group"
  value       = element(concat(aws_emr_instance_group.emr_instance_group.*.status, [""]), 0)
}
