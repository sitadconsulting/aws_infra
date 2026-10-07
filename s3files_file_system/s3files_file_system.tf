resource "aws_s3files_file_system" "s3files_file_system" {
  accept_bucket_warning = var.s3files_file_system_accept_bucket_warning
  bucket                = var.s3files_file_system_bucket
  kms_key_id            = var.s3files_file_system_kms_key_id
  prefix                = var.s3files_file_system_prefix
  role_arn              = var.s3files_file_system_role_arn
  tags                  = var.s3files_file_system_tags
}
