output "datasync_location_efs_arn" {
  description = "ARN of the DataSync Location"
  value       = element(concat(aws_datasync_location_efs.datasync_location_efs.*.arn, [""]), 0)
}
output "datasync_location_efs_id" {
  description = "ARN of the DataSync Location"
  value       = element(concat(aws_datasync_location_efs.datasync_location_efs.*.id, [""]), 0)
}
