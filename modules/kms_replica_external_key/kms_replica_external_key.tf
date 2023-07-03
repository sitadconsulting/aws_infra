resource "aws_kms_replica_external_key" "kms_replica_external_key" {
  bypass_policy_lockout_safety_check = var.kms_replica_external_key_bypass_policy_lockout_safety_check
  description                        = var.kms_replica_external_key_description
  deletion_window_in_days            = var.kms_replica_external_key_deletion_window_in_days
  enabled                            = var.kms_replica_external_key_enabled
  key_material_base64                = var.kms_replica_external_key_key_material_base64
  policy                             = var.kms_replica_external_key_policy
  primary_key_arn                    = var.kms_replica_external_key_primary_key_arn
  tags                               = var.kms_replica_external_key_tags
  valid_to                           = var.kms_replica_external_key_valid_to
}
