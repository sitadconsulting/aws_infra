resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  deletion_protection_enabled = var.cloudwatch_log_group_deletion_protection_enabled
  kms_key_id                  = var.cloudwatch_log_group_kms_key_id
  log_group_class             = var.cloudwatch_log_group_log_group_class
  name                        = var.cloudwatch_log_group_name
  name_prefix                 = var.cloudwatch_log_group_name_prefix
  retention_in_days           = var.cloudwatch_log_group_retention_in_days
  skip_destroy                = var.cloudwatch_log_group_skip_destroy
  tags                        = var.cloudwatch_log_group_tags
}

