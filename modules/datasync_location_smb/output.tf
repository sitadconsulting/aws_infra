output "datasync_location_smb_arn" {
  description = "ARN of the DataSync Location"
  value       = element(concat(aws_datasync_location_smb.datasync_location_smb.*.arn, [""]), 0)
}
