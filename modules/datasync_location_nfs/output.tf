output "datasync_location_nfs_arn" {
  description = "ARN of the DataSync Location"
  value       = element(concat(aws_datasync_location_nfs.datasync_location_nfs.*.arn, [""]), 0)
}
output "datasync_location_nfs_id" {
  description = "ARN of the DataSync Location"
  value       = element(concat(aws_datasync_location_nfs.datasync_location_nfs.*.id, [""]), 0)
}
