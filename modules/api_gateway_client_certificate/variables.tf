variable "api_gateway_client_certificate_description" {
  description = "(Optional) Description of the client certificate"
  type        = string
  default     = null
}
variable "api_gateway_client_certificate_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
