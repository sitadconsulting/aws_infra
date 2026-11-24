variable "lambda_provisioned_concurrency_config_function_name" {
  description = "(Required) Name or ARN of the Lambda Function"
  type        = string
}
variable "lambda_provisioned_concurrency_config_provisioned_concurrent_executions" {
  description = "(Required) Amount of capacity to allocate. Must be greater than or equal to 1"
  type        = number
  default     = 1
}
variable "lambda_provisioned_concurrency_config_qualifier" {
  description = "(Required) Lambda Function version or Lambda Alias name"
  type        = string
}
variable "lambda_provisioned_concurrency_config_skip_destroy" {
  description = "(Optional) Whether to retain the provisioned concurrency configuration upon destruction. Defaults to false. If set to true, the resource is simply removed from state instead"
  type        = bool
  default     = false
}
