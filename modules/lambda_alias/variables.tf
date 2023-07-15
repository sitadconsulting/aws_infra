variable "lambda_alias_description" {
  description = "Description of the alias"
  type        = string
  default     = ""
}
variable "lambda_alias_function_name" {
  description = "Lambda Function name or ARN"
  type        = string
}
variable "lambda_alias_function_version" {
  description = "Lambda function version for which you are creating the alias. Pattern: (\$LATEST|[0-9]+)"
  type        = string
}
variable "lambda_alias_name" {
  description = "Name for the alias you are creating. Pattern: (?!^[0-9]+$)([a-zA-Z0-9-_]+)"
  type        = string
}
variable "lambda_alias_routing_config" {
  description = "The Lambda alias' route configuration settings"
  type        = list(object({
    additional_version_weights = optional(map(number))
  }))
  default     = []
}
