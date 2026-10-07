resource "aws_s3files_mount_target" "s3files_mount_target" {
  file_system_id  = var.s3files_mount_target_file_system_id
  ip_address_type = var.s3files_mount_target_ip_address_type
  ipv4_address    = var.s3files_mount_target_ipv4_address
  ipv6_address    = var.s3files_mount_target_ipv6_address
  subnet_id       = var.s3files_mount_target_subnet_id
  security_groups = var.s3files_mount_target_security_groups
}
