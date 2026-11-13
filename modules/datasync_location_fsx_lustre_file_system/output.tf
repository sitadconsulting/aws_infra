output "datasync_location_fsx_lustre_file_system_arn" {
  description = "ARN of the DataSync Location"
  value       = element(concat(aws_datasync_location_fsx_lustre_file_system.datasync_location_fsx_lustre_file_system.*.arn, [""]), 0)
}
output "datasync_location_fsx_lustre_file_system_id" {
  description = "ARN of the DataSync Location"
  value       = element(concat(aws_datasync_location_fsx_lustre_file_system.datasync_location_fsx_lustre_file_system.*.id, [""]), 0)
}
output "datasync_location_fsx_lustre_file_system_url" {
  description = "The URL of the FSx for Lustre location that was described"
  value       = element(concat(aws_datasync_location_fsx_lustre_file_system.datasync_location_fsx_lustre_file_system.*.url, [""]), 0)
}
output "datasync_location_fsx_lustre_file_system_creation_time" {
  description = "The time that the FSx for Lustre location was created"
  value       = element(concat(aws_datasync_location_fsx_lustre_file_system.datasync_location_fsx_lustre_file_system.*.creation_time, [""]), 0)
}
