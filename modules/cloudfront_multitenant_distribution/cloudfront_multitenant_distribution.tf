resource "aws_cloudfront_multitenant_distribution" "cloudfront_multitenant_distribution" {
  comment             = var.cloudfront_multitenant_distribution_comment
  default_root_object = var.cloudfront_multitenant_distribution_default_root_object
  enabled             = var.cloudfront_multitenant_distribution_enabled
  http_version        = var.cloudfront_multitenant_distribution_http_version
  tags                = var.cloudfront_multitenant_distribution_tags
  web_acl_id          = var.cloudfront_multitenant_distribution_web_acl_id

  dynamic "cache_behavior" {
    for_each = var.cloudfront_multitenant_distribution_cache_behavior
      content {
        cache_policy_id            = cache_behavior.value["cache_policy_id"]
        compress                   = cache_behavior.value["compress"]
        field_level_encryption_id  = cache_behavior.value["field_level_encryption_id"]
        origin_request_policy_id   = cache_behavior.value["origin_request_policy_id"]
        path_pattern               = cache_behavior.value["path_pattern"]
        realtime_log_config_arn    = cache_behavior.value["realtime_log_config_arn"]
        response_headers_policy_id = cache_behavior.value["response_headers_policy_id"]
        target_origin_id           = cache_behavior.value["target_origin_id"]
        viewer_protocol_policy     = cache_behavior.value["viewer_protocol_policy"]
        dynamic "allowed_methods" {
          for_each = cache_behavior.value.allowed_methods
            content {
              items          = allowed_methods.value["items"]
              cached_methods = allowed_methods.value["cached_methods"]
            }
        }
        dynamic "function_association" {
          for_each = cache_behavior.value.function_association
            content {
              event_type   = function_association.value["event_type"]
              function_arn = function_association.value["function_arn"]
            }
        }
        dynamic "lambda_function_association" {
          for_each = cache_behavior.value.lambda_function_association
            content {
              event_type          = lambda_function_association.value["event_type"]
              include_body        = lambda_function_association.value["include_body"]
              lambda_function_arn = lambda_function_association.value["lambda_function_arn"]
            }
        }
        dynamic "trusted_key_groups" {
          for_each = cache_behavior.value.trusted_key_groups
            content {
              items   = trusted_key_groups.value["items"]
              enabled = trusted_key_groups.value["enabled"]
            }
        }
      }
  }
  dynamic "custom_error_response" {
    for_each = var.cloudfront_multitenant_distribution_custom_error_response
      content {
        error_caching_min_ttl = custom_error_response.value["error_caching_min_ttl"]
        error_code            = custom_error_response.value["error_code"]
        response_code         = custom_error_response.value["response_code"]
        response_page_path    = custom_error_response.value["response_page_path"]
      }
  }
  dynamic "default_cache_behavior" {
    for_each = var.cloudfront_multitenant_distribution_default_cache_behavior
      content {
        cache_policy_id            = default_cache_behavior.value["cache_policy_id"]
        compress                   = default_cache_behavior.value["compress"]
        field_level_encryption_id  = default_cache_behavior.value["field_level_encryption_id"]
        origin_request_policy_id   = default_cache_behavior.value["origin_request_policy_id"]
        realtime_log_config_arn    = default_cache_behavior.value["realtime_log_config_arn"]
        response_headers_policy_id = default_cache_behavior.value["response_headers_policy_id"]
        target_origin_id           = default_cache_behavior.value["target_origin_id"]
        viewer_protocol_policy     = default_cache_behavior.value["viewer_protocol_policy"]
        dynamic "allowed_methods" {
          for_each = default_cache_behavior.value.allowed_methods
            content {
              items          = allowed_methods.value["items"]
              cached_methods = allowed_methods.value["cached_methods"]
            }
        }
        dynamic "function_association" {
          for_each = default_cache_behavior.value.function_association
            content {
              event_type   = function_association.value["event_type"]
              function_arn = function_association.value["function_arn"]
            }
        }
        dynamic "lambda_function_association" {
          for_each = default_cache_behavior.value.lambda_function_association
            content {
              event_type          = lambda_function_association.value["event_type"]
              include_body        = lambda_function_association.value["include_body"]
              lambda_function_arn = lambda_function_association.value["lambda_function_arn"]
            }
        }
        dynamic "trusted_key_groups" {
          for_each = default_cache_behavior.value.trusted_key_groups
            content {
              items   = trusted_key_groups.value["items"]
              enabled = trusted_key_groups.value["enabled"]
            }
        }
      }
  }
  dynamic "origin" {
    for_each = var.cloudfront_multitenant_distribution_origin
      content {
        connection_attempts          = origin.value["connection_attempts"]
        connection_timeout           = origin.value["connection_timeout"]
        domain_name                  = origin.value["domain_name"]
        origin_id                    = origin.value["origin_id"]
        origin_access_control_id     = origin.value["origin_access_control_id"]
        origin_path                  = origin.value["origin_path"]
        response_completion_timeout  = origin.value["response_completion_timeout"]
        dynamic "custom_header" {
          for_each = origin.value.custom_header
            content {
              header_name  = custom_header.value["header_name"]
              header_value = custom_header.value["header_value"]
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
        dynamic "vpc_origin_config" {
          for_each = origin.value.vpc_origin_config
            content {
              origin_keepalive_timeout = vpc_origin_config.value["origin_keepalive_timeout"]
              origin_read_timeout      = vpc_origin_config.value["origin_read_timeout"]
              vpc_origin_id            = vpc_origin_config.value["vpc_origin_id"] 
            }
        }
      }
  }
  dynamic "origin_group" {
    for_each = var.cloudfront_multitenant_distribution_origin_group
      content {
        origin_id = origin_group.value["origin_id"]
        dynamic "failover_criteria" {
          for_each = origin_group.value.failover_criteria
            content {
              status_codes = failover_criteria.value["status_codes"]
            }

        }
        dynamic "member" {
          for_each = origin_group.value.member
            content {
              origin_id = member.value["origin_id"]
            }
        }
      }
  }
  dynamic "restrictions" {
    for_each = var.cloudfront_multitenant_distribution_restrictions
      content {
        dynamic "geo_restriction" {
          for_each = restrictions.value.geo_restriction
            content {
              items            = geo_restriction.value["items"] 
              restriction_type = geo_restriction.value["restriction_type"]
            }
        }
      }
  }
  dynamic "tenant_config" {
    for_each = var.cloudfront_multitenant_distribution_tenant_config
      content {
        dynamic "parameter_definition" {
          for_each = tenant_config.value.parameter_definition
            content {
              name = parameter_definition.value["name"]
              dynamic "definition" {
                for_each = parameter_definition.value.definition
                  content {
                    dynamic "string_schema" {
                      for_each = definition.value.string_schema
                        content {
                          
                        }
                    }
                  }
              }
            }
        }
      }
  }
  dynamic "viewer_certificate" {
    for_each = var.cloudfront_multitenant_distribution_viewer_certificate
      content {
        acm_certificate_arn            = viewer_certificate.value["acm_certificate_arn"]
        cloudfront_default_certificate = viewer_certificate.value["cloudfront_default_certificate"]
        minimum_protocol_version       = viewer_certificate.value["minimum_protocol_version"]
        ssl_support_method             = viewer_certificate.value["ssl_support_method"]
      }
  }
}
