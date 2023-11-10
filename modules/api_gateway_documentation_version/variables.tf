variable "api_gateway_documentation_version_version" {
  description = "Version identifier of the API documentation snapshot"
  type        = string

}
variable "api_gateway_documentation_version_rest_api_id" {
  description = "ID of the associated Rest API"
  type        = string
}
variable "api_gateway_documentation_version_description" {
  description = "Description of the API documentation version"
  type        = string
  default     = ""
}
