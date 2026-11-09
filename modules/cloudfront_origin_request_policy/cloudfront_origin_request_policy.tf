resource "aws_cloudfront_origin_request_policy" "cloudfront_origin_request_policy" {
  comment = var.cloudfront_origin_request_policy_comment
  name    = var.cloudfront_origin_request_policy_name

  dynamic "cookies_config" {
    for_each = var.cloudfront_origin_request_policy_cookies_config
      content {
        cookie_behavior = cookies_config.value["cookie_behavior"]
        dynamic "cookies" {
          for_each = cookies_config.value.cookies
            content {
              items = items.value["items"]
            }
        }
      }
  }
  dynamic "headers_config" {
    for_each = var.cloudfront_origin_request_policy_headers_config
      content {
        header_behavior = headers_config.value["header_behavior"]
        dynamic "headers" {
          for_each = headers_config.value.headers
            content {
              items = items.value["items"]
            }
        }
      }
  }
  dynamic "query_strings_config" {
    for_each = var.cloudfront_origin_request_policy_query_strings_config
      content {
        query_string_behavior = query_strings_config.value["query_string_behavior"]
        dynamic "query_strings" {
          for_each = query_strings_config.value.query_strings
            content {
              items = items.value["items"]
            }
        }
      }
  }
}
