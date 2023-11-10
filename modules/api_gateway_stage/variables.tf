variable "api_gateway_stage_cache_cluster_enabled" {
  description = "Whether a cache cluster is enabled for the stage"
  type        = bool
  default     = false
}
variable "api_gateway_stage_cache_cluster_size" {
  description = "Size of the cache cluster for the stage, if enabled. Allowed values include 0.5, 1.6, 6.1, 13.5, 28.4, 58.2, 118 and 237"
  type        = string
  default     = null
}
variable "api_gateway_stage_client_certificate_id" {
  description = "Identifier of a client certificate for the stage"
  type        = string
  default     = null
}
variable "api_gateway_stage_deployment_id" {
  description = "ID of the deployment that the stage points to"
  type        = string
}
variable "api_gateway_stage_description" {
  description = "Description of the stage"
  type        = string
  default     = ""
}
variable "api_gateway_stage_documentation_version" {
  description = "Version of the associated API documentation"
  type        = string
  default     = null
}
variable "api_gateway_stage_rest_api_id" {
  description = "ID of the associated REST API"
  type        = string
}
variable "api_gateway_stage_stage_name" {
  description = "Name of the stage"
  type        = string
}
variable "api_gateway_stage_variables" {
  description = "Map that defines the stage variables"
  type        = map(string)
  default     = {}
}
variable "api_gateway_stage_tags" {
  description = "Map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "api_gateway_stage_xray_tracing_enabled" {
  description = "Whether active tracing with X-ray is enabled. Defaults to false"
  type        = bool
  default     = false
}
variable "api_gateway_stage_access_log_settings" {
  description = "Enables access logs for the API stage"
  type        = list(object({
    destination_arn = string
    format          = string
  }))
  default     = []
}
variable "api_gateway_stage_canary_settings" {
  description = "Configuration settings of a canary deployment"
  type        = list(object({
    percent_traffic          = optional(number)
    stage_variable_overrides = optional(map(string))
    use_stage_cache          = optional(bool)
  }))
  default     = []
}
