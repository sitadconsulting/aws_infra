variable "lambda_invocation_function_name" {
  description = "(Required) Name of the Lambda function"
  type        = string
}
variable "lambda_invocation_input" {
  description = "(Required) JSON payload to the Lambda function"
  type        = string
}
variable "lambda_invocation_lifecycle_scope" {
  description = "(Optional) Lifecycle scope of the resource to manage. Valid values are CREATE_ONLY and CRUD. Defaults to CREATE_ONLY. CREATE_ONLY will invoke the function only on creation or replacement. CRUD will invoke the function on each lifecycle event, and augment the input JSON payload with additional lifecycle information"
  type        = string
  default     = null
}
variable "lambda_invocation_qualifier" {
  description = "(Optional) Qualifier (i.e., version) of the Lambda function. Defaults to $LATEST"
  type        = string 
  default     = null
}
variable "lambda_invocation_tenant_id" {
  description = "(Optional) Tenant ID to serve invocations from specified tenant"
  type        = string
  default     = null
}
variable "lambda_invocation_terraform_key" {
  description = "(Optional) JSON key used to store lifecycle information in the input JSON payload. Defaults to tf. This additional key is only included when lifecycle_scope is set to CRUD"
  type        = string
  default     = null
}
variable "lambda_invocation_triggers" {
  description = "(Optional) Map of arbitrary keys and values that, when changed, will trigger a re-invocation. To force a re-invocation without changing these keys/values, use the terraform taint command"
  type        = map(string)
  default     = {}
}
