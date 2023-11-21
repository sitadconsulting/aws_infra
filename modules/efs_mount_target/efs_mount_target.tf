resource "aws_efs_mount_target" "efs_mount_target" {
  file_system_id  = var.efs_mount_target_file_system_id
  ip_address      = var.efs_mount_target_ip_address
  security_groups = var.efs_mount_target_security_groups 
  subnet_id       = var.efs_mount_target_subnet_id
}

