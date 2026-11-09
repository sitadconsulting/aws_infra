variable "cloudfront_multitenant_distribution_comment" {
  description = "(Required) Any comments you want to include about the distribution"
  type        = string
}
variable "cloudfront_multitenant_distribution_default_root_object" {
  description = "(Optional) Object that you want CloudFront to return when an end user requests the root URL"
  type        = string
  default     = null
}
variable "cloudfront_multitenant_distribution_enabled" {
  description = "(Required) Whether the distribution is enabled to accept end user requests for content"
  type        = bool
  default     = null
}
variable "cloudfront_multitenant_distribution_http_version" {
  description = "(Optional) Maximum HTTP version to support on the distribution. Allowed values are http1.1, http2, http2and3, and http3. Default: http2"
  type        = string
  default     = null
}
variable "cloudfront_multitenant_distribution_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "cloudfront_multitenant_distribution_web_acl_id" {
  description = "(Optional) Unique identifier that specifies the AWS WAF v2 web ACL to associate with this distribution"
  type        = string
  default     = null
}
variable "cloudfront_multitenant_distribution_cache_behavior" {
  description = "(Optional) Ordered list of cache behaviors resource for this distribution"
  type        = list(object({
    cache_policy_id            = optional(string)
    compress                   = optional(bool)
    field_level_encryption_id  = optional(string)
    origin_request_policy_id   = optional(string)
    path_pattern               = string
    realtime_log_config_arn    = optional(string)
    response_headers_policy_id = optional(string)
    target_origin_id           = string
    viewer_protocol_policy     = string
    allowed_methods            = list(object({
      items          = list(string)
      cached_methods = list(string)
    }))
    function_association        = optional(list(object({
      event_type   = string
      function_arn = string
    })), [])
    lambda_function_association = optional(list(object({
      event_type          = string
      include_body        = optional(bool)
      lambda_function_arn = string
    })), [])
    trusted_key_groups          = optional(list(object({
      items   = optional(list(string))
      enabled = optional(bool)
    })), [])
  }))
  default     = []
}
variable "cloudfront_multitenant_distribution_custom_error_response" {
  description = "(Optional) One or more custom error response elements"
  type        = list(object({
    error_caching_min_ttl = optional(number)
    error_code            = optional(number)
    response_code         = optional(string)
    response_page_path    = optional(string)
  }))
  default     = []
}
variable "cloudfront_multitenant_distribution_default_cache_behavior" {
  description = "(Required) Default cache behavior for this distribution"
  type        = list(object({
    cache_policy_id            = optional(string)
    compress                   = optional(bool)
    field_level_encryption_id  = optional(string)
    origin_request_policy_id   = optional(string)
    realtime_log_config_arn    = optional(string)
    response_headers_policy_id = optional(string)
    target_origin_id           = string
    viewer_protocol_policy     = string
    allowed_methods            = list(object({
      items          = list(string)
      cached_methods = list(string)
    }))
    function_association        = optional(list(object({
      event_type   = string
      function_arn = string
    })), [])
    lambda_function_association = optional(list(object({
      event_type          = string
      include_body        = optional(bool)
      lambda_function_arn = string
    })), [])
    trusted_key_groups          = optional(list(object({
      items   = optional(list(string))
      enabled = optional(bool)
    })), [])
  }))
}
variable "cloudfront_multitenant_distribution_origin" {
  description = "(Required) One or more origins for this distribution (multiples allowed)"
  type        = list(object({
    connection_attempts          = optional(number)
    connection_timeout           = optional(number)
    domain_name                  = string
    origin_id                    = string
    origin_access_control_id     = optional(string)
    origin_path                  = optional(string)
    response_completion_timeout  = optional(number)
    custom_header                = optional(list(object({
      header_name  = string
      header_value = string
    })), [])
    custom_origin_config        = optional(list(object({
      http_port                = number
      https_port               = number
      ip_address_type          = optional(string)
      origin_keepalive_timeout = optional(number)
      origin_read_timeout      = optional(number)
      origin_protocol_policy   = string
      origin_ssl_protocols     = string
      origin_mtls_config       = optional(list(object({
        client_certificate_arn = string
      })), []) 
    })), [])
    origin_shield               = optional(list(object({
      enabled              = bool
      origin_shield_region = optional(string)
    })), [])               
    vpc_origin_config           = optional(list(object({
      origin_keepalive_timeout = optional(number)
      origin_read_timeout      = optional(number)
      vpc_origin_id            = string
    })), [])
  }))
}
variable "cloudfront_multitenant_distribution_origin_group" {
  description = "(Optional) One or more origin_group for this distribution (multiples allowed)"
  type        = list(object({
    origin_id         = string 
    failover_criteria = list(object({
      status_codes = list(string)
    }))
    member            = list(object({
      origin_id = string
    }))
  }))
  default     = []
}
variable "cloudfront_multitenant_distribution_restrictions" {
  description = "(Required) Restriction configuration for this distribution"
  type        = list(object({
    geo_restriction = list(object({
      items            = optional(list(string))
      restriction_type = string
    }))
  }))
  default     = []
}
variable "cloudfront_multitenant_distribution_tenant_config" {
  description = " (Required) Tenant configuration that contains parameter definitions for multi-tenant distributions"
  type        = list(object({
    parameter_definition = list(object({
      name       = string
      definition = list(object({
        string_schema = list(object({
          required      = bool
          comment       = optional(string)
          default_value = optional(string)
        }))
      })) 
    }))
  }))
}
variable "cloudfront_multitenant_distribution_viewer_certificate" {
  description = "(Required) SSL configuration for this distribution"
  type        = list(object({
    acm_certificate_arn            = optional(string)
    cloudfront_default_certificate = optional(bool)
    minimum_protocol_version       = optional(string)
    ssl_support_method             = optional(string)
  }))
}
