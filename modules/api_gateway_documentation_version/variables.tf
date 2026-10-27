variable "api_gateway_documentation_version_description" {
  description = "(Optional) Description of the API documentation version"
  type        = string
  default     = null
}
variable "api_gateway_documentation_version_rest_api_id" {
  description = "(Required) ID of the associated Rest API"
  type        = string
}
variable "api_gateway_documentation_version_version" {
  description = "(Required) Version identifier of the API documentation snapshot"
  type        = string
}
