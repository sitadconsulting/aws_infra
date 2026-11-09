resource "aws_cloudfront_distribution" "cloudfront_distribution" {
  aliases                         = var.cloudfront_distribution_aliases
  anycast_ip_list_id              = var.cloudfront_distribution_anycast_ip_list_id
  comment                         = var.cloudfront_distribution_comment
  continuous_deployment_policy_id = var.cloudfront_distribution_continuous_deployment_policy_id
  default_root_object             = var.cloudfront_distribution_default_root_object
  enabled                         = var.cloudfront_distribution_enabled
  http_version                    = var.cloudfront_distribution_http_version
  is_ipv6_enabled                 = var.cloudfront_distribution_is_ipv6_enabled
  price_class                     = var.cloudfront_distribution_price_class
  retain_on_delete                = var.cloudfront_distribution_retain_on_delete
  staging                         = var.cloudfront_distribution_staging
  tags                            = var.cloudfront_distribution_tags   
  wait_for_deployment             = var.cloudfront_distribution_wait_for_deployment
  web_acl_id                      = var.cloudfront_distribution_web_acl_id

  dynamic "cache_tag_config" {
    for_each = var.cloudfront_distribution_cache_tag_config
      content {
        header_name = cache_tag_config.value["header_name"]
      }
  }
  dynamic "connection_function_association" {
    for_each = var.cloudfront_distribution_connection_function_association
      content {
        id = connection_function_association.value["id"]
      }
  }
  dynamic "custom_error_response" {
    for_each = var.cloudfront_distribution_custom_error_response
      content {
        error_caching_min_ttl = custom_error_response.value["error_caching_min_ttl"]
        error_code            = custom_error_response.value["error_code"]
        response_code         = custom_error_response.value["response_code"]
        response_page_path    = custom_error_response.value["response_page_path"]
      }
  }
  dynamic "default_cache_behavior" {
    for_each = var.cloudfront_distribution_default_cache_behavior
      content {
        allowed_methods             = default_cache_behavior.value["allowed_methods"]
        cache_policy_id             = default_cache_behavior.value["cache_policy_id"]
        cached_methods              = default_cache_behavior.value["cached_methods"]
        compress                    = default_cache_behavior.value["compress"]
        default_ttl                 = default_cache_behavior.value["default_ttl"]
        field_level_encryption_id   = default_cache_behavior.value["field_level_encryption_id"]
        max_ttl                     = default_cache_behavior.value["max_ttl"]
        min_ttl                     = default_cache_behavior.value["min_ttl"]
        origin_request_policy_id    = default_cache_behavior.value["origin_request_policy_id"]
        realtime_log_config_arn     = default_cache_behavior.value["realtime_log_config_arn"]
        response_headers_policy_id  = default_cache_behavior.value["response_headers_policy_id"]
        smooth_streaming            = default_cache_behavior.value["smooth_streaming"]
        target_origin_id            = default_cache_behavior.value["target_origin_id"]
        trusted_key_groups          = default_cache_behavior.value["trusted_key_groups"]
        trusted_signers             = default_cache_behavior.value["trusted_signers"]
        viewer_protocol_policy      = default_cache_behavior.value["viewer_protocol_policy"]
        dynamic "function_association" {
          for_each = default_cache_behavior.value.function_association
            content {
              event_type   = function_association.value["event_type"]
              function_arn = function_association.value["function_arn"]
            }
        }
        dynamic "grpc_config" {
          for_each = default_cache_behavior.value.grpc_config
            content {
              enabled = grpc_config.value["enabled"]
            }
        }
        dynamic "lambda_function_association" {
          for_each = default_cache_behavior.value.lambda_function_association
            content {
              event_type   = lambda_function_association.value["event_type"]
              include_body = lambda_function_association.value["include_body"]
              lambda_arn   = lambda_function_association.value["lambda_arn"]
            }
        }
      }
  }
  dynamic "logging_config" {
    for_each = var.cloudfront_distribution_logging_config
      content {
        bucket          = logging_config.value["bucket"]
        include_cookies = logging_config.value["include_cookies"]
        prefix          = logging_config.value["prefix"]
      }
  }
  dynamic "ordered_cache_behavior" {
    for_each = var.cloudfront_distribution_ordered_cache_behavior
      content {
        allowed_methods             = ordered_cache_behavior.value["allowed_methods"]
        cache_policy_id             = ordered_cache_behavior.value["cache_policy_id"]
        cached_methods              = ordered_cache_behavior.value["cached_methods"]
        compress                    = ordered_cache_behavior.value["compress"]
        default_ttl                 = ordered_cache_behavior.value["default_ttl"]
        field_level_encryption_id   = ordered_cache_behavior.value["field_level_encryption_id"]
        max_ttl                     = ordered_cache_behavior.value["max_ttl"]
        min_ttl                     = ordered_cache_behavior.value["min_ttl"]
        origin_request_policy_id    = ordered_cache_behavior.value["origin_request_policy_id"]
        path_pattern                = ordered_cache_behavior.value["path_pattern"]
        realtime_log_config_arn     = ordered_cache_behavior.value["realtime_log_config_arn"]
        response_headers_policy_id  = ordered_cache_behavior.value["response_headers_policy_id"]
        smooth_streaming            = ordered_cache_behavior.value["smooth_streaming"]
        target_origin_id            = ordered_cache_behavior.value["target_origin_id"]
        trusted_key_groups          = ordered_cache_behavior.value["trusted_key_groups"]
        trusted_signers             = ordered_cache_behavior.value["trusted_signers"]
        viewer_protocol_policy      = ordered_cache_behavior.value["viewer_protocol_policy"]       
        dynamic "function_association" {
          for_each = default_cache_behavior.value.function_association
            content {
              event_type   = function_association.value["event_type"]
              function_arn = function_association.value["function_arn"]
            }
        }
        dynamic "grpc_config" {
          for_each = default_cache_behavior.value.grpc_config
            content {
              enabled = grpc_config.value["enabled"]
            }
        }
        dynamic "lambda_function_association" {
          for_each = default_cache_behavior.value.lambda_function_association
            content {
              event_type   = lambda_function_association.value["event_type"]
              include_body = lambda_function_association.value["include_body"]
              lambda_arn   = lambda_function_association.value["lambda_arn"]
            }
        }
      }
  }
  dynamic "origin" {
    for_each = var.cloudfront_distribution_origin
      content {
        connection_attempts         = origin.value["connection_attempts"]
        connection_timeout          = origin.value["connection_timeout"]
        domain_name                 = origin.value["domain_name"]
        origin_access_control_id    = origin.value["origin_access_control_id"]
        origin_id                   = origin.value["origin_id"]
        origin_path                 = origin.value["origin_path"]
        response_completion_timeout = origin.value["response_completion_timeout"]
        dynamic "custom_header" {
          for_each = origin.value.custom_header
            content {
              name  = custom_header.value["name"]
              value = custom_header.value["value"]
            }
        }
        dynamic "custom_origin_config" {
          for_each = origin.value.custom_origin_config
            content {
              http_port                = custom_origin_config.value["http_port"]
              https_port               = custom_origin_config.value["https_port"]
              ip_address_type          = custom_origin_config.value["ip_address_type"]
              origin_keepalive_timeout = custom_origin_config.value["origin_keepalive_timeout"]
              origin_read_timeout      = custom_origin_config.value["origin_read_timeout"]
              origin_protocol_policy   = custom_origin_config.value["origin_protocol_policy"]
              origin_ssl_protocols     = custom_origin_config.value["origin_ssl_protocols"]
              dynamic "origin_mtls_config" {
                for_each = custom_origin_config.value.origin_mtls_config
                  content {
                    client_certificate_arn = origin_mtls_config.value["client_certificate_arn"]
                  }
              }
            }
        }
        dynamic "origin_shield" {
          for_each = origin.value.origin_shield
            content {
              enabled              = origin_shield.value["enabled"]
              origin_shield_region = origin_shield.value["origin_shield_region"]
            }
        }
        dynamic "s3_origin_config" {
          for_each = origin.value.s3_origin_config
            content {
              origin_access_identity = s3_origin_config.value["origin_access_identity"]
            }
        }
        dynamic "vpc_origin_config" {
          for_each = origin.value.vpc_origin_config
            content {
              origin_keepalive_timeout = vpc_origin_config.value["origin_keepalive_timeout"]
              origin_read_timeout      = vpc_origin_config.value["origin_read_timeout"]
              owner_account_id         = vpc_origin_config.value["owner_account_id"]
              vpc_origin_id            = vpc_origin_config.value["vpc_origin_id"]
            }
        }
      }
  }
  dynamic "origin_group" {
    for_each = var.cloudfront_distribution_origin_group
      content {
        origin_id = origin.value["origin_id"]
        dynamic "failover_criteria" {
          for_each = origin.value.failover_criteria
            content {
              status_codes = failover_criteria.value["status_codes"]
            }
        }
        dynamic "member" {
          for_each = origin.value.member
            content {
              origin_id = member.value["origin_id"]
            }
        }
      }
  }
  dynamic "restrictions" {
    for_each = var.cloudfront_distribution_restrictions
      content {
        dynamic "geo_restriction" {
          for_each = restrictions.value.geo_restriction
            content {
              locations        = geo_restriction.value["locations"]
              restriction_type = geo_restriction.value["restriction_type"]
            }
        }
      }
  }
  dynamic "viewer_certificate" {
    for_each = var.cloudfront_distribution_viewer_certificate
      content {
        acm_certificate_arn            = viewer_certificate.value["acm_certificate_arn"]
        cloudfront_default_certificate = viewer_certificate.value["cloudfront_default_certificate"]
        iam_certificate_id             = viewer_certificate.value["iam_certificate_id"]
        minimum_protocol_version       = viewer_certificate.value["minimum_protocol_version"]
        ssl_support_method             = viewer_certificate.value["ssl_support_method"]
      }
  }
  dynamic "viewer_mtls_config" {
    for_each = var.cloudfront_distribution_viewer_mtls_config
      content {
        mode     = viewer_mtls_config.value["mode"]
        dynamic "trust_store_config" {
          for_each = viewer_mtls_config.value.trust_store_config
            content {
              trust_store_id                 = string
              advertise_trust_store_ca_names = optional(bool)
              ignore_certificate_expiry      = optional(bool)
            }
        }
      }
  }
}
