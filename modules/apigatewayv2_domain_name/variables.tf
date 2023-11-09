variable "apigatewayv2_domain_name_domain_name" {
  description = "Domain name. Must be between 1 and 512 characters in length"
  type        = string
}
variable "apigatewayv2_domain_name_tags" {
  description = "Map of tags to assign to the domain name. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "apigatewayv2_domain_name_domain_name_configuration" {
  description = "Domain name configuration"
  type        = list(object({
    certificate_arn                        = string
    endpoint_type                          = string
    ownership_verification_certificate_arn = optional(string)
    security_policy                        = string   
  }))
}
variable "apigatewayv2_domain_name_mutual_tls_authentication" {
  description = "Mutual TLS authentication configuration for the domain name"
  type        = list(object({
    truststore_uri     = apigatewayv2_domain_name_mutual_tls_authentication.value["truststore_uri"]
    truststore_version = apigatewayv2_domain_name_mutual_tls_authentication.value["truststore_version"]
  }))
  default     = []
}
