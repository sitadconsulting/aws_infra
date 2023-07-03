resource "aws_kms_external_key" "kms_external_key" {
  bypass_policy_lockout_safety_check = var.kms_external_key_bypass_policy_lockout_safety_check
  deletion_window_in_days            = var.kms_external_key_deletion_window_in_days
  description                        = var.kms_external_key_description
  enabled                            = var.kms_external_key_enabled
  key_material_base64                = var.kms_external_key_key_material_base64
  multi_region                       = var.kms_external_key_multi_region
  policy                             = var.kms_external_key_policy
  tags                               = var.kms_external_key_tags
  valid_to                           = var.kms_external_key_valid_to
}
