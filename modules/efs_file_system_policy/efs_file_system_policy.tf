resource "aws_efs_file_system_policy" "efs_file_system_policy" {
  bypass_policy_lockout_safety_check = var.efs_file_system_policy_bypass_policy_lockout_safety_check
  file_system_id                     = var.efs_file_system_policy_file_system_id
  policy                             = var.efs_file_system_policy_policy
}
