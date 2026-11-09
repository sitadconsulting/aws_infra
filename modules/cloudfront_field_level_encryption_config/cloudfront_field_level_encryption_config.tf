resource "aws_cloudfront_field_level_encryption_config" "cloudfront_field_level_encryption_config" {
  comment = var.cloudfront_field_level_encryption_config_comment

  dynamic "content_type_profile_config" {
    for_each = var.cloudfront_field_level_encryption_config_content_type_profile_config
      content {
        forward_when_content_type_is_unknown = content_type_profile_config.value["forward_when_content_type_is_unknown"]
        dynamic "content_type_profiles" {
          for_each = content_type_profile_config.value.content_type_profiles
            content {
              content_type = content_type_profiles.value["content_type"]
              format       = content_type_profiles.value["format"]
              profile_id   = content_type_profiles.value["profile_id"]
            }
        }
      }
  }
  dynamic "query_arg_profile_config" {
    for_each = var.cloudfront_field_level_encryption_config_query_arg_profile_config
      content {
        forward_when_query_arg_profile_is_unknown = query_arg_profile_config.value["forward_when_query_arg_profile_is_unknown"]
        dynamic "query_arg_profiles" {
          for_each = query_arg_profile_config.value.query_arg_profiles
            content {
              profile_id = query_arg_profiles.value["profile_id"]
              query_arg  = query_arg_profiles.value["query_arg"]
            }
        }
      }
  }
}
