output "datasync_location_object_storage_arn" {
  description = "ARN of the DataSync Location"
  value       = element(concat(aws_datasync_location_object_storage.datasync_location_object_storage.*.arn, [""]), 0)
}
output "datasync_location_object_storage_uri" {
  description = "The URL of the Object Storage location that was described"
  value       = element(concat(aws_datasync_location_object_storage.datasync_location_object_storage.*.uri, [""]), 0)
}
