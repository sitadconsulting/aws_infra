variable "apigatewayv2_domain_name_domain_name" {
  description = "(Required) Domain name. Must be between 1 and 512 characters in length"
  type        = string
}
variable "apigatewayv2_domain_name_routing_mode" {
  description = "(Optional) Mode to route traffic for the domain name. Valid values: API_MAPPING_ONLY, ROUTING_RULE_ONLY, ROUTING_RULE_THEN_API_MAPPING"
  type        = string
  default     = null
}
variable "apigatewayv2_domain_name_tags" {
  description = "(Optional) Map of tags to assign to the domain name"
  type        = map(string)
  default     = {}
}
variable "apigatewayv2_domain_name_domain_name_configuration" {
  description = "(Required) Domain name configuration"
  type        = list(object({
    certificate_arn                        = string
    endpoint_type                          = string
    ip_address_type                        = optional(string)
    ownership_verification_certificate_arn = optional(string)
    security_policy                        = string   
  }))
}
variable "apigatewayv2_domain_name_mutual_tls_authentication" {
  description = "(Optional) Mutual TLS authentication configuration for the domain name"
  type        = list(object({
    truststore_uri     = string
    truststore_version = optional(string)
  }))
  default     = []
}
