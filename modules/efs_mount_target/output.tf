output "efs_mount_target_id" {
  description = "Mount target ID"
  value       = element(concat(aws_efs_mount_target.efs_mount_target.*.id, [""]), 0)
}
output "efs_mount_target_dns_name" {
  description = "EFS file system, DNS Name"
  value       = element(concat(aws_efs_mount_target.efs_mount_target.*.dns_name, [""]), 0)
}
output "efs_mount_target_mount_target_dns_name" {
  description = "Mount target, Availability zone DNS Name"
  value       = element(concat(aws_efs_mount_target.efs_mount_target.*.mount_target_dns_name, [""]), 0)
}
output "efs_mount_target_file_system_arn" {
  description = "Filesystem ARN"
  value       = element(concat(aws_efs_mount_target.efs_mount_target.*.file_system_arn, [""]), 0)
}
output "efs_mount_target_network_interface_id" {
  description = "The ID of the network interface that Amazon EFS created when it created the mount target"
  value       = element(concat(aws_efs_mount_target.efs_mount_target.*.network_interface_id, [""]), 0)
}
output "efs_mount_target_availability_zone_name" {
  description = "The name of the Availability Zone (AZ) that the mount target resides in"
  value       = element(concat(aws_efs_mount_target.efs_mount_target.*.availability_zone_name, [""]), 0)
}
output "efs_mount_target_availability_zone_id" {
  description = "The unique and consistent identifier of the Availability Zone (AZ) that the mount target resides in"
  value       = element(concat(aws_efs_mount_target.efs_mount_target.*.availability_zone_id, [""]), 0)
}
output "efs_mount_target_owner_id" {
  description = "AWS account ID that owns the resource"
  value       = element(concat(aws_efs_mount_target.efs_mount_target.*.owner_id, [""]), 0)
}
