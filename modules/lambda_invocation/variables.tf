variable "lambda_invocation_function_name" {
  description = "Name of the lambda function"
  type        = string
}
variable "lambda_invocation_input" {
  description = "JSON payload to the lambda function"
  type        = string
}
variable "lambda_invocation_lifecycle_scope" {
  description = "Lifecycle scope of the resource to manage. Valid values are CREATE_ONLY and CRUD. Defaults to CREATE_ONLY. CREATE_ONLY will invoke the function only on creation or replacement. CRUD will invoke the function on each lifecycle event, and augment the input JSON payload with additional lifecycle information"
  type        = string
  default     = ""
}
variable "lambda_invocation_qualifier" {
  description = "Qualifier (i.e., version) of the lambda function. Defaults to $LATEST"
  type        = string 
  default     = null
}
variable "lambda_invocation_terraform_key" {
  description = "The JSON key used to store lifecycle information in the input JSON payload. Defaults to tf. This additional key is only included when lifecycle_scope is set to CRUD"
  type        = string
  default     = null
}
variable "lambda_invocation_triggers" {
  description = "Map of arbitrary keys and values that, when changed, will trigger a re-invocation. To force a re-invocation without changing these keys/values, use the terraform taint command"
  type        = map(string)
  default     = {}
}
