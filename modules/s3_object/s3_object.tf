resource "aws_s3_object" "s3_object" {
  acl                           = var.s3_object_acl
  bucket                        = var.s3_object_bucket
  bucket_key_enabled            = var.s3_object_bucket_key_enabled
  cache_control                 = var.s3_object_cache_control
  content                       = var.s3_object_content
  content_base64                = var.s3_object_content_base64
  content_disposition           = var.s3_object_content_disposition
  content_encoding              = var.s3_object_content_encoding
  content_language              = var.s3_object_content_language
  content_type                  = var.s3_object_content_type
  etag                          = var.s3_object_etag
  force_destroy                 = var.s3_object_force_destroy
  key                           = var.s3_object_key
  kms_key_id                    = var.s3_object_kms_key_id
  metadata                      = var.s3_object_metadata
  object_lock_legal_hold_status = var.s3_object_object_lock_legal_hold_status
  object_lock_mode              = var.s3_object_object_lock_mode
  object_lock_retain_until_date = var.s3_object_object_lock_retain_until_date
  server_side_encryption        = var.s3_object_server_side_encryption
  source                        = var.s3_object_source
  source_hash                   = var.s3_object_source_hash
  storage_class                 = var.s3_object_storage_class
  tags                          = var.s3_object_tags
  website_redirect              = var.s3_object_website_redirect

  lifecycle {
    ignore_changes = all
  }
}
