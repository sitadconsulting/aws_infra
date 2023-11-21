output "efs_file_system_arn" {
  description = "Filesystem ARN"
  value       = element(concat(aws_efs_file_system.efs_file_system.*.arn, [""]), 0)
}
output "efs_file_system_availability_zone_id" {
  description = "The identifier of the Availability Zone in which the file system's One Zone storage classes exist"
  value       = element(concat(aws_efs_file_system.efs_file_system.*.availability_zone_id, [""]), 0)
}
output "efs_file_system_id" {
  description = "The ID that identifies the file system (e.g., fs-ccfc0d65)"
  value       = element(concat(aws_efs_file_system.efs_file_system.*.id, [""]), 0)
}
output "efs_file_system_dns_name" {
  description = "The DNS name for the filesystem"
  value       = element(concat(aws_efs_file_system.efs_file_system.*.dns_name, [""]), 0)
}
output "efs_file_system_name" {
  description = "The value of the file system's Name tag"
  value       = element(concat(aws_efs_file_system.efs_file_system.*.name, [""]), 0)
}
output "efs_file_system_number_of_mount_targets" {
  description = "The current number of mount targets that the file system has"
  value       = element(concat(aws_efs_file_system.efs_file_system.*.number_of_mount_targets, [""]), 0)
}
output "efs_file_system_owner_id" {
  description = "The AWS account that created the file system. If the file system was createdby an IAM user, the parent account to which the user belongs is the owner"
  value       = element(concat(aws_efs_file_system.efs_file_system.*.owner_id, [""]), 0)
}
output "efs_file_system_size_in_bytes" {
  description = "The latest known metered size (in bytes) of data stored in the file system, the value is not the exact size that the file system was at any point in time"
  value       = element(concat(aws_efs_file_system.efs_file_system.*.size_in_bytes, [""]), 0)
}
