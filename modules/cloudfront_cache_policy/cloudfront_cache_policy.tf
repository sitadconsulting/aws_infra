resource "aws_cloudfront_cache_policy" "cloudfront_cache_policy" {
  comment     = var.cloudfront_cache_policy_comment
  default_ttl = var.cloudfront_cache_policy_default_ttl
  max_ttl     = var.cloudfront_cache_policy_max_ttl
  min_ttl     = var.cloudfront_cache_policy_min_ttl
  name        = var.cloudfront_cache_policy_name

  dynamic "parameters_in_cache_key_and_forwarded_to_origin" {
    for_each = var.cloudfront_cache_policy_parameters_in_cache_key_and_forwarded_to_origin
      content {
        enable_accept_encoding_brotli = parameters_in_cache_key_and_forwarded_to_origin.value["enable_accept_encoding_brotli"]
        enable_accept_encoding_gzip   = parameters_in_cache_key_and_forwarded_to_origin.value["enable_accept_encoding_gzip"]
        dynamic "cookies_config" {
          for_each = parameters_in_cache_key_and_forwarded_to_origin.value.cookies_config
            content {
              cookie_behavior = cookies_config.value["cookie_behavior"]
              dynamic "cookies" {
                for_each = cookies_config.value.cookies
                  content {
                    items = cookies.value["items"]
                  }
              }
            }
        }
        dynamic "headers_config" {
          for_each = parameters_in_cache_key_and_forwarded_to_origin.value.headers_config
            content {
              header_behavior = headers_config.value["header_behavior"]
              dynamic "headers" {
                for_each = headers_config.value.headers
                  content {
                    items = headers.value["items"]
                  }
              }
            }
        }
        dynamic "query_strings_config" {
          for_each = parameters_in_cache_key_and_forwarded_to_origin.value.query_strings_config
            content {
              query_string_behavior = query_strings_config.value["query_string_behavior"]
              dynamic "query_strings" {
                for_each = query_strings_config.value.query_strings
                  content {
                    items = query_strings.value["items"]
                  }
              }
            }
        }
      }
   }
}
