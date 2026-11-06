variable "appsync_resolver_api_id" {
  description = "(Required) API ID for the GraphQL API"
  type        = string
}
variable "appsync_resolver_code" {
  description = "(Optional) Function code that contains the request and response functions. When code is used, the runtime is required. The runtime value must be APPSYNC_JS"
  type        = string
  default     = null
}
variable "appsync_resolver_data_source" {
  description = "(Optional) Data source name"
  type        = string
  default     = null
}
variable "appsync_resolver_field" {
  description = "(Required) Field name from the schema defined in the GraphQL API"
  type        = string
}
variable "appsync_resolver_kind" {
  description = "(Optional) Resolver type. Valid values are UNIT and PIPELINE"
  type        = string
  default     = null
}
variable "appsync_resolver_max_batch_size" {
  description = "(Optional) Maximum batching size for a resolver. Valid values are between 0 and 2000"
  type        = number
  default     = null
}
variable "appsync_resolver_request_template" {
  description = "(Optional) Request mapping template for UNIT resolver or 'before mapping template' for PIPELINE resolver. Required for non-Lambda resolvers"
  type        = string
  default     = null
}
variable "appsync_resolver_response_template" {
  description = "(Optional) Response mapping template for UNIT resolver or 'after mapping template' for PIPELINE resolver. Required for non-Lambda resolvers"
  type        = string
  default     = null
}
variable "appsync_resolver_type" {
  description = "(Required) Type name from the schema defined in the GraphQL API"
  type        = string
}
variable "appsync_resolver_caching_config" {
  description = "(Optional) Caching Config"
  type        = list(object({
    caching_keys = optional(list(string))
    ttl          = optional(number)
  }))
  default     = []
}
variable "appsync_resolver_pipeline_config" {
  description = "(Optional) Caching configuration for the resolver"
  type        = list(object({
    functions = optional(list(string))  
  }))
  default     = []
}
variable "appsync_resolver_runtime" {
  description = "(Optional) Runtime used by an AWS AppSync pipeline resolver or AWS AppSync function. Specifies the name and version of the runtime to use. Note that if a runtime is specified, code must also be specified"
  type        = list(object({
    name            = string
    runtime_version = string
  }))
  default     = []
}
variable "appsync_resolver_sync_config" {
  description = "(Optional) Sync configuration for a resolver"
  type        = list(object({
    conflict_detection             = optional(string)
    conflict_handler               = optional(string)
    lambda_conflict_handler_config = optional(list(object({
      lambda_conflict_handler_arn = optional(string)
    })), [])
  }))
  default     = []
}
