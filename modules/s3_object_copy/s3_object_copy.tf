resource "aws_s3_object_copy" "s3_object_copy" {
  acl                           = var.s3_object_copy_acl
  bucket                        = var.s3_object_copy_bucket
  cache_control                 = var.s3_object_copy_cache_control
  content_disposition           = var.s3_object_copy_content_disposition
  content_encoding              = var.s3_object_copy_content_encoding
  content_language              = var.s3_object_copy_content_language
  content_type                  = var.s3_object_copy_content_type
  copy_if_match                 = var.s3_object_copy_copy_if_match
  copy_if_modified_since        = var.s3_object_copy_copy_if_modified_since
  copy_if_none_match            = var.s3_object_copy_copy_if_none_match
  copy_if_unmodified_since      = var.s3_object_copy_copy_if_unmodified_since
  customer_algorithm            = var.s3_object_copy_customer_algorithm
  customer_key                  = var.s3_object_copy_customer_key
  customer_key_md5              = var.s3_object_copy_customer_key_md5
  expected_bucket_owner         = var.s3_object_copy_expected_bucket_owner
  expected_source_bucket_owner  = var.s3_object_copy_expected_source_bucket_owner
  expires                       = var.s3_object_copy_expires
  force_destroy                 = var.s3_object_copy_force_destroy
  key                           = var.s3_object_copy_key
  kms_encryption_context        = var.s3_object_copy_kms_encryption_context
  kms_key_id                    = var.s3_object_copy_kms_key_id
  metadata                      = var.s3_object_copy_metadata
  metadata_directive            = var.s3_object_copy_metadata_directive
  object_lock_legal_hold_status = var.s3_object_copy_object_lock_legal_hold_status
  object_lock_mode              = var.s3_object_copy_object_lock_mode
  object_lock_retain_until_date = var.s3_object_copy_object_lock_retain_until_date
  request_payer                 = var.s3_object_copy_request_payer
  server_side_encryption        = var.s3_object_copy_server_side_encryption
  source                        = var.s3_object_copy_source
  source_customer_algorithm     = var.s3_object_copy_source_customer_algorithm
  source_customer_key           = var.s3_object_copy_source_customer_key
  source_customer_key_md5       = var.s3_object_copy_source_customer_key_md5
  storage_class                 = var.s3_object_copy_storage_class
  tagging_directive             = var.s3_object_copy_tagging_directive
  tags                          = var.s3_object_copy_tags
  website_redirect              = var.s3_object_copy_website_redirect

  dynamic "grant" {
    for_each = var.s3_object_copy_grant
      content {
        email      = grant.value["email"]
        id         = grant.value["id"]
        permission = grant.value["permission"]
        type       = grant.value["type"]
        uri        = grant.value["uri"]
      }
  }
}
