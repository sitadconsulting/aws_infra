variable "lambda_function_scaling_config_function_name" {
  description = "(Required) Name or ARN of the Lambda function. Changing this forces a new resource"
  type        = string
}
variable "lambda_function_scaling_config_qualifier" {
  description = "(Required) Qualifier for the scaling configuration. Valid values: $LATEST.PUBLISHED to target the latest published version, or a specific numeric version number (e.g., 1). Changing this forces a new resource"
  type        = string
}
variable "lambda_function_scaling_config_function_scaling_config" {
  description = "(Required) Scaling configuration block"
  type        = list(object({
    max_execution_environments = optional(number)
    min_execution_environments = optional(number)
  }))
}
