resource "aws_kms_key" "kms_key" {
  bypass_policy_lockout_safety_check = var.kms_key_bypass_policy_lockout_safety_check
  custom_key_store_id                = var.kms_key_custom_key_store_id
  customer_master_key_spec           = var.kms_key_customer_master_key_spec
  deletion_window_in_days            = var.kms_key_deletion_window_in_days
  description                        = var.kms_key_description
  enable_key_rotation                = var.kms_key_enable_key_rotation
  is_enabled                         = var.kms_key_is_enabled
  key_usage                          = var.kms_key_key_usage
  multi_region                       = var.kms_key_multi_region
  policy                             = var.kms_key_policy
  tags                               = var.kms_key_tags
}
