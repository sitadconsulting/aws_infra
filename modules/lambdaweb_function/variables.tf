variable "lambdaweb_function_function_name" {
  description = "(Required) Web function name"
  type        = string
}
variable "lambdaweb_function_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
