resource "aws_kms_alias" "kms_alias" {
  name          = var.kms_alias_name
  name_prefix   = var.kms_alias_name_prefix
  target_key_id = var.kms_alias_target_key_id
}
