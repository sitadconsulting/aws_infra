output "s3files_mount_target_availability_zone_id" {
  description = "Availability Zone ID"
  value       = element(concat(aws_s3files_mount_target.s3files_mount_target.*.availability_zone_id, [""]), 0)
}
output "s3files_mount_target_id" {
  description = "Identifier of the mount target"
  value       = element(concat(aws_s3files_mount_target.s3files_mount_target.*.id, [""]), 0)
}
output "s3files_mount_target_network_interface_id" {
  description = "Network interface ID"
  value       = element(concat(aws_s3files_mount_target.s3files_mount_target.*.network_interface_id, [""]), 0)
}
output "s3files_mount_target_owner_id" {
  description = "AWS account ID of the owner"
  value       = element(concat(aws_s3files_mount_target.s3files_mount_target.*.owner_id, [""]), 0)
}
output "s3files_mount_target_status" {
  description = "Mount target status"
  value       = element(concat(aws_s3files_mount_target.s3files_mount_target.*.status, [""]), 0)
}
output "s3files_mount_target_status_message" {
  description = "Status message"
  value       = element(concat(aws_s3files_mount_target.s3files_mount_target.*.status_message, [""]), 0)
}
output "s3files_mount_target_vpc_id" {
  description = "VPC ID"
  value       = element(concat(aws_s3files_mount_target.s3files_mount_target.*.vpc_id, [""]), 0)
}
