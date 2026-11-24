variable "lambda_function_recursion_config_function_name" {
  description = "(Required) Name of the Lambda function"
  type        = string
}
variable "lambda_function_recursion_config_recursive_loop" {
  description = "(Required) Lambda function recursion configuration. Valid values are Allow or Terminate"
  type        = string
}
