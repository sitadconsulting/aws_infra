variable "appsync_function_api_id" {
  description = "(Required) ID of the associated AppSync API"
  type        = string
}
variable "appsync_function_code" {
  description = "(Optional) Function code that contains the request and response functions. When code is used, the runtime is required. The runtime value must be APPSYNC_JS"
  type        = string
  default     = null
}
variable "appsync_function_data_source" {
  description = "(Required) Function data source name"
  type        = string
}
variable "appsync_function_description" {
  description = "(Optional) Function description"
  type        = string
  default     = null
}
variable "appsync_function_function_version" {
  description = "(Optional) Version of the request mapping template. Currently the supported value is 2018-05-29. Does not apply when specifying code"
  type        = string
  default     = null
}
variable "appsync_function_max_batch_size" {
  description = "(Optional) Maximum batching size for a resolver. Valid values are between 0 and 2000"
  type        = number
  default     = null
}
variable "appsync_function_name" {
  description = "(Required) Function name. The function name does not have to be unique"
  type        = string
}
variable "appsync_function_request_mapping_template" {
  description = "(Optional) Function request mapping template. Functions support only the 2018-05-29 version of the request mapping template"
  type        = string
  default     = null
}
variable "appsync_function_response_mapping_template" {
  description = "(Optional) Function response mapping template"
  type        = string
  default     = null
}
variable "appsync_function_runtime" {
  description = "(Optional) Runtime used by an AWS AppSync pipeline resolver or AWS AppSync function. Specifies the name and version of the runtime to use. Note that if a runtime is specified, code must also be specified"
  type        = list(object({
    name            = string 
    runtime_version = string
  }))
  default     = []
}
variable "appsync_function_sync_config" {
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
