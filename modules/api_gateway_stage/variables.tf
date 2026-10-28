variable "api_gateway_stage_cache_cluster_enabled" {
  description = "(Optional) Whether a cache cluster is enabled for the stage"
  type        = bool
  default     = false
}
variable "api_gateway_stage_cache_cluster_size" {
  description = "(Optional) Size of the cache cluster for the stage, if enabled. Allowed values include 0.5, 1.6, 6.1, 13.5, 28.4, 58.2, 118 and 237"
  type        = string
  default     = null
}
variable "api_gateway_stage_client_certificate_id" {
  description = "(Optional) Identifier of a client certificate for the stage"
  type        = string
  default     = null
}
variable "api_gateway_stage_deployment_id" {
  description = "(Required) ID of the deployment that the stage points to"
  type        = string
}
variable "api_gateway_stage_description" {
  description = "(Optional) Description of the stage"
  type        = string
  default     = null
}
variable "api_gateway_stage_documentation_version" {
  description = "(Optional) Version of the associated API documentation"
  type        = string
  default     = null
}
variable "api_gateway_stage_rest_api_id" {
  description = "(Required) ID of the associated REST API"
  type        = string
}
variable "api_gateway_stage_stage_name" {
  description = "(Required) Name of the stage"
  type        = string
}
variable "api_gateway_stage_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "api_gateway_stage_variables" {
  description = "(Optional) Map that defines the stage variables"
  type        = map(string)
  default     = {}
}
variable "api_gateway_stage_xray_tracing_enabled" {
  description = "(Optional) Whether active tracing with X-ray is enabled. Defaults to false"
  type        = bool
  default     = false
}
variable "api_gateway_stage_access_log_settings" {
  description = "(Optional) Enables access logs for the API stage"
  type        = list(object({
    destination_arn = string
    format          = string
  }))
  default     = []
}
variable "api_gateway_stage_canary_settings" {
  description = "(Optional) Configuration settings of a canary deployment"
  type        = list(object({
    deployment_id            = string
    percent_traffic          = optional(number)
    stage_variable_overrides = optional(map(string))
    use_stage_cache          = optional(bool)
  }))
  default     = []
}
