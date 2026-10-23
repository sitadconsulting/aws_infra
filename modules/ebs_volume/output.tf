output "ebs_volume_arn" {
  description = "Volume ARN (e.g., arn:aws:ec2:us-east-1:123456789012:volume/vol-59fcb34e)"
  value       = element(concat(aws_ebs_volume.ebs_volume.*.arn, [""]), 0)
}
output "ebs_volume_create_time" {
  description = "Timestamp when volume creation was initiated"
  value       = element(concat(aws_ebs_volume.ebs_volume.*.create_time, [""]), 0)
}
output "ebs_volume_id" {
  description = "Volume ID (e.g., vol-59fcb34e)"
  value       = element(concat(aws_ebs_volume.ebs_volume.*.id, [""]), 0)
}
