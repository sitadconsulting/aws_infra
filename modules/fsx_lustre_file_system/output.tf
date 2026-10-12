output "fsx_lustre_file_system_arn" {
  description = "File system ARN"
  value       = element(concat(aws_fsx_lustre_file_system.fsx_lustre_file_system.*.arn, [""]), 0)
}
output "fsx_lustre_file_system_dns_name" {
  description = "File system DNS Name"
  value       = element(concat(aws_fsx_lustre_file_system.fsx_lustre_file_system.*.dns_name, [""]), 0)
}
output "fsx_lustre_file_system_id" {
  description = "File system ID"
  value       = element(concat(aws_fsx_lustre_file_system.fsx_lustre_file_system.*.id, [""]), 0)
}
output "fsx_lustre_file_system_mount_name" {
  description = "File system Mount Name"
  value       = element(concat(aws_fsx_lustre_file_system.fsx_lustre_file_system.*.mount_name, [""]), 0)
}
output "fsx_lustre_file_system_network_interface_ids" {
  description = "File system Network Interface IDs "
  value       = element(concat(aws_fsx_lustre_file_system.fsx_lustre_file_system.*.network_interface_ids, [""]), 0)
}
output "fsx_lustre_file_system_owner_id" {
  description = "File system Account Owner ID"
  value       = element(concat(aws_fsx_lustre_file_system.fsx_lustre_file_system.*.owner_id, [""]), 0)
}
output "fsx_lustre_file_system_vpc_id" {
  description = "File system Associated VPC ID"
  value       = element(concat(aws_fsx_lustre_file_system.fsx_lustre_file_system.*.vpc_id, [""]), 0)
}
