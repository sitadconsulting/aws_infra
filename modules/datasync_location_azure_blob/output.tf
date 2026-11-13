output "datasync_location_azure_blob_arn" {
  description = "ARN of the DataSync Location"
  value       = element(concat(aws_datasync_location_azure_blob.datasync_location_azure_blob.*.arn, [""]), 0)
}
