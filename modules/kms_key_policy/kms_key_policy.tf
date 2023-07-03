resource "aws_kms_key_policy" "kms_key_policy" {
  bypass_policy_lockout_safety_check = var.kms_key_policy_bypass_policy_lockout_safety_check
  key_id                             = var.kms_key_policy_key_id
  policy                             = var.kms_key_policy_policy
