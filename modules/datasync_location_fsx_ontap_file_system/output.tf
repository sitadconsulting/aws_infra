output "datasync_location_fsx_ontap_file_system_arn" {
  description = "ARN of the DataSync Location for the FSx Ontap File System"
  value       = element(concat(aws_datasync_location_fsx_ontap_file_system.datasync_location_fsx_ontap_file_system.*.arn, [""]), 0)
}
output "datasync_location_fsx_ontap_file_system_fsx_filesystem_arn" {
  description = "ARN of the FSx Ontap File System"
  value       = element(concat(aws_datasync_location_fsx_ontap_file_system.datasync_location_fsx_ontap_file_system.*.fsx_filesystem_arn, [""]), 0)
}
output "datasync_location_fsx_ontap_file_system_uri" {
  description = "URI of the FSx ONTAP file system location"
  value       = element(concat(aws_datasync_location_fsx_ontap_file_system.datasync_location_fsx_ontap_file_system.*.uri, [""]), 0)
}
