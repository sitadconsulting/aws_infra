resource "aws_efs_backup_policy" "efs_backup_policy" {
  file_system_id = var.efs_backup_policy_file_system_id

  dynamic "backup_policy" {
    for_each = var.efs_backup_policy_backup_policy
      content {
        status = backup_policy.value["status"]
      }
  }
}
