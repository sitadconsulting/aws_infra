output "datasync_location_s3_arn" {
  description = "ARN of the DataSync Location"
  value       = element(concat(aws_datasync_location_s3.datasync_location_s3.*.arn, [""]), 0)
}
output "datasync_location_s3_id" {
  description = "ARN of the DataSync Location"
  value       = element(concat(aws_datasync_location_s3.datasync_location_s3.*.id, [""]), 0)
}
