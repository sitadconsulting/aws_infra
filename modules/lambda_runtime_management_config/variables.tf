variable "lambda_runtime_management_config_function_name" {
  description = "(Required) Name or ARN of the Lambda function"
  type        = string
}
variable "lambda_runtime_management_config_qualifier" {
  description = "(Optional) Version of the function. This can be $LATEST or a published version number. If omitted, this resource will manage the runtime configuration for $LATEST"
  type        = string
  default     = null
}
variable "lambda_runtime_management_config_runtime_version_arn" {
  description = "(Optional) ARN of the runtime version. Only required when update_runtime_on is Manual"
  type        = string
  default     = null
}
variable "lambda_runtime_management_config_update_runtime_on" {
  description = "(Optional) Runtime update mode. Valid values are Auto, FunctionUpdate, and Manual. When a function is created, the default mode is Auto"
  type        = string
  default     = null
}
