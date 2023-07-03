resource "aws_kms_replica_key" "kms_replica_key" {
  bypass_policy_lockout_safety_check = var.kms_replica_key_bypass_policy_lockout_safety_check
  description                        = var.kms_replica_key_description
  deletion_window_in_days            = var.kms_replica_key_deletion_window_in_days
  enabled                            = var.kms_replica_key_enabled
  policy                             = var.kms_replica_key_policy
  primary_key_arn                    = var.kms_replica_key_primary_key_arn
  tags                               = var.kms_replica_key_tags
}
