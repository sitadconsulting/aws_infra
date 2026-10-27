variable "api_gateway_deployment_description" {
  description = "(Optional) Description of the deployment"
  type        = string
  default     = null
}
variable "api_gateway_deployment_rest_api_id" {
  description = "(Required) REST API identifier"
  type        = string
}
variable "api_gateway_deployment_triggers" {
  description = "(Optional) Map of arbitrary keys and values that, when changed, will trigger a redeployment. To force a redeployment without changing these keys/values, use the -replace option with terraform plan or terraform apply"
  type        = map(string)
  default     = {}
}
variable "api_gateway_deployment_variables" {
  description = "(Optional) Map to set on the related stage"
  type        = map(string)
  default     = {}
}
