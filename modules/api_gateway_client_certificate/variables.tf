variable "api_gateway_client_certificate_description" {
  description = "Description of the client certificate"
  type        = string
  default     = ""
}
variable "api_gateway_client_certificate_tags" {
  description = "Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
