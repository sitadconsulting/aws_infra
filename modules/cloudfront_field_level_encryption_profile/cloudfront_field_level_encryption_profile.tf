resource "aws_cloudfront_field_level_encryption_profile" "cloudfront_field_level_encryption_profile" {
  comment = var.cloudfront_field_level_encryption_profile_comment
  name    = var.cloudfront_field_level_encryption_profile_name

  dynamic "encryption_entities" {
    for_each = var.cloudfront_field_level_encryption_profile_encryption_entities
      content {
        public_key_id  = encryption_entities.value["public_key_id"]
        provider_id    = encryption_entities.value["provider_id"]
        field_patterns = encryption_entities.value["field_patterns"]
      }
  } 
}
