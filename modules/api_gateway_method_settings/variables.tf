variable "api_gateway_method_settings_method_path" {
  description = "(Required) Method path defined as {resource_path}/{http_method} for an individual method override, or */* for overriding all methods in the stage. Ensure to trim any leading forward slashes in the path (e.g., trimprefix(aws_api_gateway_resource.example.path, \"/\"))"
  type        = string
}
variable "api_gateway_method_settings_rest_api_id" {
  description = "(Required) ID of the REST API"
  type        = string
}
variable "api_gateway_method_settings_stage_name" {
  description = "(Required) Name of the stage"
  type        = string
}
variable "api_gateway_method_settings_settings" {
  description = "(Required) Settings block"
  type        = list(object({
    cache_data_encrypted                       = optional(bool)
    cache_ttl_in_seconds                       = optional(number)
    caching_enabled                            = optional(bool)
    data_trace_enabled                         = optional(bool)
    logging_level                              = optional(string)
    metrics_enabled                            = optional(bool)
    require_authorization_for_cache_control    = optional(bool)
    throttling_burst_limit                     = optional(number)
    throttling_rate_limit                      = optional(number)
    unauthorized_cache_control_header_strategy = optional(string)
  }))
}
