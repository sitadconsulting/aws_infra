variable "cloudfront_origin_request_policy_comment" {
  description = "(Optional) Comment to describe the origin request policy"
  type        = string
  default     = null
}
variable "cloudfront_origin_request_policy_name" {
  description = "(Required) Unique name to identify the origin request policy"
  type        = string
}
variable "cloudfront_origin_request_policy_cookies_config" {
  description = "(Required) Object that determines whether any cookies in viewer requests (and if so, which cookies) are included in the origin request key and automatically included in requests that CloudFront sends to the origin"
  type        = list(object({
    cookie_behavior = string
    cookies         = optional(list(object({
      items = optional(list(string)) 
    })), [])
  }))
}
variable "cloudfront_origin_request_policy_headers_config" {
  description = "(Required) Object that determines whether any HTTP headers (and if so, which headers) are included in the origin request key and automatically included in requests that CloudFront sends to the origin"
  type        = list(object({
    header_behavior = optional(string)
    headers         = optional(list(object({
      items = optional(list(string)) 
    })), [])
  }))
}
variable "cloudfront_origin_request_policy_query_strings_config" {
  description = "(Required) Object that determines whether any URL query strings in viewer requests (and if so, which query strings) are included in the origin request key and automatically included in requests that CloudFront sends to the origin"
  type        = list(object({
    query_string_behavior = string
    query_strings         = optional(list(object({
      items = optional(list(string))
    })), [])
  }))
}
