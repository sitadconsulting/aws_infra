variable "api_gateway_rest_api_put_body" {
  description = "(Required) PUT request body containing external API definitions. Currently, only OpenAPI definition JSON/YAML files are supported. The maximum size of the API definition file is 6MB"
  type        = string
}
variable "api_gateway_rest_api_put_fail_on_warnings" {
  description = "(Optional) Whether to rollback the API update when a warning is encountered. The default value is false"
  type        = bool
  default     = false
}
variable "api_gateway_rest_api_put_parameters" {
  description = "(Optional) Map of customizations for importing the specification in the body argument. For example, to exclude DocumentationParts from an imported API, use ignore = \"documentation\". Additional documentation, including other parameters such as basepath, can be found in the API Gateway Developer Guide"
  type        = map(string)
  default     = {}
}
variable "api_gateway_rest_api_put_rest_api_id" {
  description = "(Required) Identifier of the associated REST API"
  type        = string
}
variable "api_gateway_rest_api_put_triggers" {
  description = "(Optional) Map of arbitrary keys and values that, when changed, will trigger a redeployment. To force a redeployment without changing these keys/values, use the -replace option with terraform plan or terraform apply"
  type        = map(string)
  default     = {}
}
