variable "appsync_api_cache_api_caching_behavior" {
  description = "(Required) Caching behavior. Valid values are FULL_REQUEST_CACHING and PER_RESOLVER_CACHING"
  type        = string
}
variable "appsync_api_cache_api_id" {
  description = "(Required) GraphQL API ID"
  type        = string
}
variable "appsync_api_cache_at_rest_encryption_enabled" {
  description = "(Optional) At-rest encryption flag for cache. You cannot update this setting after creation"
  type        = bool
  default     = null
}
variable "appsync_api_cache_transit_encryption_enabled" {
  description = "(Optional) Transit encryption flag when connecting to cache. You cannot update this setting after creation"
  type        = bool
  default     = null
}
variable "appsync_api_cache_ttl" {
  description = "(Required) TTL in seconds for cache entries"
  type        = number
}
variable "appsync_api_cache_type" {
  description = "(Required) Cache instance type. Valid values are SMALL, MEDIUM, LARGE, XLARGE, LARGE_2X, LARGE_4X, LARGE_8X, LARGE_12X, T2_SMALL, T2_MEDIUM, R4_LARGE, R4_XLARGE, R4_2XLARGE, R4_4XLARGE, R4_8XLARGE"
  type        = string
}
