variable "api_gateway_method_settings_rest_api_id" {
  description = "ID of the REST API"
  type        = string
}
variable "api_gateway_method_settings_stage_name" {
  description = "Name of the stage"
  type        = string
}
variable "api_gateway_method_settings_method_path" {
  description = "Method path defined as {resource_path}/{http_method} for an individual method override, or */* for overriding all methods in the stage. Ensure to trim any leading forward slashes in the path (e.g., trimprefix(aws_api_gateway_resource.example.path, \"/\"))"
  type        = string
}
variable "api_gateway_method_settings_settings" {
  description = "Settings block"
  type        = list(object({
    metrics_enabled                            = optional(bool)
    logging_level                              = optional(string)
    data_trace_enabled                         = optional(bool)
    throttling_burst_limit                     = optional(number)
    throttling_rate_limit                      = optional(number)
    caching_enabled                            = optional(bool)
    cache_ttl_in_seconds                       = optional(number)
    cache_data_encrypted                       = optional(bool)
    require_authorization_for_cache_control    = optional(bool)
    unauthorized_cache_control_header_strategy = optional(string)
  }))
  default     = [] 
}
