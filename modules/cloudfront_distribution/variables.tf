variable "cloudfront_distribution_aliases" {
  description = "(Optional) - Extra CNAMEs (alternate domain names), if any, for this distribution"
  type        = string
  default     = null
}
variable "cloudfront_distribution_anycast_ip_list_id" {
  description = "(Optional) - ID of the Anycast static IP list that is associated with the distribution"
  type        = string
  default     = null
}
variable "cloudfront_distribution_comment" {
  description = "(Optional) - Any comments you want to include about the distribution"
  type        = string
  default     = null
}
variable "cloudfront_distribution_continuous_deployment_policy_id" {
  description = "(Optional) - Identifier of a continuous deployment policy. This argument should only be set on a production distribution"
  type        = string
  default     = null
}
variable "cloudfront_distribution_default_root_object" {
  description = "(Optional) - Object that you want CloudFront to return (for example, index.html) when an end user requests the root URL"
  type        = string
  default     = null
}
variable "cloudfront_distribution_enabled" {
  description = "(Required) - Whether the distribution is enabled to accept end user requests for content"
  type        = bool
}
variable "cloudfront_distribution_http_version" {
  description = "(Optional) - Maximum HTTP version to support on the distribution. Allowed values are http1.1, http2, http2and3 and http3. The default is http2"
  type        = string
  default     = null
}
variable "cloudfront_distribution_is_ipv6_enabled" {
  description = "(Optional) - Whether the IPv6 is enabled for the distribution"
  type        = bool
  default     = null
}
variable "cloudfront_distribution_price_class" {
  description = "(Optional) - Price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100"
  type        = string
  default     = null
}
variable "cloudfront_distribution_retain_on_delete" {
  description = "(Optional) - Disables the distribution instead of deleting it when destroying the resource through Terraform. If this is set, the distribution needs to be deleted manually afterwards. Default: false"
  type        = bool
  default     = false
}
variable "cloudfront_distribution_staging" {
  description = "(Optional) - A Boolean that indicates whether this is a staging distribution. Defaults to false"
  type        = bool
  default     = false
}
variable "cloudfront_distribution_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "cloudfront_distribution_wait_for_deployment" {
  description = "(Optional) - If enabled, the resource will wait for the distribution status to change from InProgress to Deployed. Setting this tofalse will skip the process. Default: true"
  type        = bool
  default     = true
}
variable "cloudfront_distribution_web_acl_id" {
  description = "(Optional) - Unique identifier that specifies the AWS WAF web ACL, if any, to associate with this distribution. To specify a web ACL created using the latest version of AWS WAF (WAFv2), use the ACL ARN, for example aws_wafv2_web_acl.example.arn. To specify a web ACL created using AWS WAF Classic, use the ACL ID, for example aws_waf_web_acl.example.id. The WAF Web ACL must exist in the WAF Global (CloudFront) region and the credentials configuring this argument must have waf:GetWebACL permissions assigned"
  type        = string
  default     = null
}
variable "cloudfront_distribution_cache_tag_config" {
  description = "(Optional) - Cache tag configuration block for cache tag extraction from origin responses (maximum one)"
  type        = list(object({
    header_name = string
  }))
  default     = []
}
variable "cloudfront_distribution_connection_function_association" {
  description = "(Optional) - A connection function association configuration block (maximum one)"
  type        = list(object({
    id = string
  }))
  default     = []
}
variable "cloudfront_distribution_custom_error_response" {
  description = "(Optional) - One or more custom error response elements (multiples allowed)"
  type        = list(object({
    error_caching_min_ttl = optional(number)
    error_code            = number
    response_code         = optional(number)
    response_page_path    = optional(string)
  }))
  default     = []
}
variable "cloudfront_distribution_default_cache_behavior" {
  description = "(Required) - Default cache behavior for this distribution (maximum one). Requires either cache_policy_id (preferred) or forwarded_values (deprecated) be set"
  type        = list(object({
    allowed_methods             = list(string)
    cache_policy_id             = optional(string)
    cached_methods              = list(string)
    compress                    = optional(bool)
    default_ttl                 = optional(number)
    field_level_encryption_id   = optional(string)
    max_ttl                     = optional(number)
    min_ttl                     = optional(number)
    origin_request_policy_id    = optional(string)
    realtime_log_config_arn     = optional(string)
    response_headers_policy_id  = optional(string)  
    smooth_streaming            = optional(bool)
    target_origin_id            = string
    trusted_key_groups          = optional(list(string))
    trusted_signers             = optional(list(string))
    viewer_protocol_policy      = string
    function_association        = optional(list(object({
      event_type   = string
      function_arn = string
    })), [])
    grpc_config                 = optional(list(object({
      enabled = optional(bool)
    })), [])
    lambda_function_association = optional(list(object({
      event_type   = string
      include_body = optional(bool)
      lambda_arn   = string
    })), []) 
  }))
}
variable "cloudfront_distribution_logging_config" {
  description = "(Optional) - The logging configuration that controls how logs are written to your distribution (maximum one). AWS provides two versions of access logs for CloudFront: Legacy and v2. This argument configures legacy version standard logs"
  type        = list(object({
    bucket          = optional(string)
    include_cookies = optional(bool)
    prefix          = optional(string)
  }))
  default     = []
}
variable "cloudfront_distribution_ordered_cache_behavior" {
  description = "(Optional) - Ordered list of cache behaviors resource for this distribution. List from top to bottom in order of precedence. The topmost cache behavior will have precedence 0"
  type        = list(object({
    allowed_methods             = list(string)
    cache_policy_id             = optional(string)
    cached_methods              = list(string)
    compress                    = optional(bool)
    default_ttl                 = optional(number)
    field_level_encryption_id   = optional(string)
    max_ttl                     = optional(number)
    min_ttl                     = optional(number)
    origin_request_policy_id    = optional(string)
    path_pattern                = string
    realtime_log_config_arn     = optional(string)
    response_headers_policy_id  = optional(string)
    smooth_streaming            = optional(bool)
    target_origin_id            = string
    trusted_key_groups          = optional(list(string))
    trusted_signers             = optional(list(string))
    viewer_protocol_policy      = string
    function_association        = optional(list(object({
      event_type   = string
      function_arn = string
    })), [])
    grpc_config                 = optional(list(object({
      enabled = optional(bool)
    })), [])
    lambda_function_association = optional(list(object({
      event_type   = string
      include_body = optional(bool)
      lambda_arn   = string
    })), [])
  }))
  default     = []
}
variable "cloudfront_distribution_origin" {
  description = "(Required) - One or more origins for this distribution (multiples allowed)"
  type        = list(object({
    connection_attempts         = optional(number)
    connection_timeout          = optional(number)
    domain_name                 = string
    origin_access_control_id    = optional(string)
    origin_id                   = string
    origin_path                 = optional(string)
    response_completion_timeout = optional(number)
    custom_header               = optional(list(object({
      name  = string
      value = string
    })), [])
    custom_origin_config        = optional(list(object({
      http_port                = number
      https_port               = number
      ip_address_type          = optional(string)
      origin_keepalive_timeout = optional(number)
      origin_read_timeout      = optional(number)
      origin_protocol_policy   = string
      origin_ssl_protocols     = list(string)
      origin_mtls_config       = optional(list(object({
        client_certificate_arn = string
      })), [])
    })), [])
    origin_shield               = optional(list(object({
      enabled              = bool
      origin_shield_region = optional(string)
    })), [])
    s3_origin_config            = optional(list(object({
      origin_access_identity = string
    })), [])
    vpc_origin_config           = optional(list(object({
      origin_keepalive_timeout = optional(number)
      origin_read_timeout      = optional(number)
      owner_account_id         = optional(string)
      vpc_origin_id            = string
    })), [])
  }))
}
variable "cloudfront_distribution_origin_group" {
  description = "(Optional) - One or more origin_group for this distribution (multiples allowed)"
  type        = list(object({
    origin_id         = string
    failover_criteria = list(object({
      status_codes = list(string)
    }))
    member            = list(object({
      origin_id         = string
      failover_criteria = list(object({
        status_codes = list(string)
      }))
      member            = list(object({
        origin_id = string
      }))
    }))
  }))
  default     = []
}
variable "cloudfront_distribution_restrictions" {
  description = "(Required) - The restriction configuration for this distribution (maximum one)"
  type        = list(object({
    geo_restriction = list(object({
      locations        = optional(list(string))
      restriction_type = string
    }))
  }))
}
variable "cloudfront_distribution_viewer_certificate" {
  description = "(Required) - The SSL configuration for this distribution (maximum one)"
  type        = list(object({
    acm_certificate_arn            = optional(string)
    cloudfront_default_certificate = optional(bool)
    iam_certificate_id             = optional(string)
    minimum_protocol_version       = optional(string)
    ssl_support_method             = optional(string)
  }))
}
variable "cloudfront_distribution_viewer_mtls_config" {
  description = "(Optional) - The viewer mTLS configuration for this distribution (maximum one)"
  type        = list(object({
    mode               = optional(string)
    trust_store_config = optional(list(object({
      trust_store_id                 = string
      advertise_trust_store_ca_names = optional(bool)
      ignore_certificate_expiry      = optional(bool)
    })), [])
  }))
  default     = []
}
