variable "cloudfront_response_headers_policy_comment" {
  description = "(Optional) A comment to describe the response headers policy. The comment cannot be longer than 128 characters"
  type        = string
  default     = null
}
variable "cloudfront_response_headers_policy_name" {
  description = "(Required) A unique name to identify the response headers policy"
  type        = string
}
variable "cloudfront_response_headers_policy_cors_config" {
  description = "(Optional) A configuration for a set of HTTP response headers that are used for Cross-Origin Resource Sharing (CORS)"
  type        = list(object({
    access_control_allow_credentials = bool
    access_control_max_age_sec       = optional(number)
    origin_override                  = bool
    access_control_allow_headers     = list(object({
      items = optional(list(string))
    }))
    access_control_allow_methods     = list(object({
      items = optional(list(string))
    }))
    access_control_allow_origins     = list(object({
      items = optional(list(string))
    }))
    access_control_expose_headers    = optional(list(object({
      items = optional(list(string))
    })), [])
  }))
  default     = []
}
variable "cloudfront_response_headers_policy_custom_headers_config" {
  description = "(Optional) Object that contains an attribute items that contains a list of custom headers"
  type        = list(object({
    header   = string
    override = bool
    value    = string
  }))
  default     = []
}
variable "cloudfront_response_headers_policy_remove_headers_config" {
  description = "(Optional) A configuration for a set of HTTP headers to remove from the HTTP response. Object that contains an attribute items that contains a list of headers"
  type        = list(object({
    header = string
  }))
  default     = []
}
variable "cloudfront_response_headers_policy_security_headers_config" {
  description = "(Optional) A configuration for a set of security-related HTTP response headers"
  type        = list(object({
    content_security_policy   = optional(list(object({
      content_security_policy = string
      override                = bool
    })), [])
    content_type_options      = optional(list(object({
      override = bool
    })), [])
    frame_options             = optional(list(object({
      frame_option = string
      override     = bool
    })), [])
    referrer_policy           = optional(list(object({
      override        = bool
      referrer_policy = string
    })), [])
    strict_transport_security = optional(list(object({
      access_control_max_age_sec = number
      include_subdomains         = optional(bool)
      override                   = bool
      preload                    = optional(bool)
    })), [])
    xss_protection            = optional(list(object({
      mode_block = optional(bool)
      override   = bool
      protection = bool
      report_uri = optional(string) 
    })), [])
  }))
  default     = []
}
variable "cloudfront_response_headers_policy_server_timing_headers_config" {
  description = "(Optional) A configuration for enabling the Server-Timing header in HTTP responses sent from CloudFront"
  type        = list(object({
    enabled       = bool
    sampling_rate = number
  }))
  default     = []
}
