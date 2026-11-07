variable "cloudfront_cache_policy_comment" {
  description = "(Optional) Description for the cache policy"
  type        = string
  default     = null
}
variable "cloudfront_cache_policy_default_ttl" {
  description = "(Optional) Amount of time, in seconds, that objects are allowed to remain in the CloudFront cache before CloudFront sends a new request to the origin server to check if the object has been updated"
  type        = number
  default     = null
}
variable "cloudfront_cache_policy_max_ttl" {
  description = "(Optional) Maximum amount of time, in seconds, that objects stay in the CloudFront cache before CloudFront sends another request to the origin to see if the object has been updated"
  type        = number
  default     = null
}
variable "cloudfront_cache_policy_min_ttl" {
  description = "(Required) Minimum amount of time, in seconds, that objects should remain in the CloudFront cache before a new request is sent to the origin to check for updates"
  type        = number
}
variable "cloudfront_cache_policy_name" {
  description = "(Required) Unique name used to identify the cache policy"
  type        = string
}
variable "cloudfront_cache_policy_parameters_in_cache_key_and_forwarded_to_origin" {
  description = "(Required) Configuration for including HTTP headers, cookies, and URL query strings in the cache key"
  type        = list(object({
    enable_accept_encoding_brotli = optional(bool)
    enable_accept_encoding_gzip   = optional(bool)
    cookies_config                = list(object({
      cookie_behavior = string
      cookies         = optional( list(object({
        items = optional(list(string))
      })), [])
    }))
    headers_config                = list(object({
      header_behavior = string
      headers         = optional(list(object({
        items = optional(list(string))
      })), [])         
    }))
    query_strings_config          = list(object({
      query_string_behavior = string
      query_strings         = optional(list(object({
        items = optional(list(string))
      })), [])
    }))
  }))
}
