output "datasync_location_hdfs_arn" {
  description = "ARN of the DataSync Location"
  value       = element(concat(aws_datasync_location_hdfs.datasync_location_hdfs.*.arn, [""]), 0)
}
