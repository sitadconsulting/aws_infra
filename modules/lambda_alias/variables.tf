variable "lambda_alias_description" {
  description = "(Optional) Description of the alias"
  type        = string
  default     = null
}
variable "lambda_alias_function_name" {
  description = "(Required) Name or ARN of the Lambda function"
  type        = string
}
variable "lambda_alias_function_version" {
  description = "(Required) Lambda function version for which you are creating the alias. Pattern: (\$LATEST|[0-9]+)"
  type        = string
}
variable "lambda_alias_name" {
  description = "(Required) Name for the alias. Pattern: (?!^[0-9]+$)([a-zA-Z0-9-_]+)"
  type        = string
}
variable "lambda_alias_routing_config" {
  description = "(Optional) Lambda alias' route configuration settings"
  type        = list(object({
    additional_version_weights = optional(map(number))
  }))
  default     = []
}
