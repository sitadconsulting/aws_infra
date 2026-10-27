variable "api_gateway_domain_name_certificate_arn" {
  description = "(Optional) ARN for an AWS-managed certificate. AWS Certificate Manager is the only supported source. Used when an edge-optimized domain name is desired. Conflicts with certificate_name, certificate_body, certificate_chain, certificate_private_key, regional_certificate_arn, and regional_certificate_name"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_certificate_body" {
  description = "(Optional) Certificate issued for the domain name being registered, in PEM format. Only valid for EDGE endpoint configuration type. Conflicts with certificate_arn, regional_certificate_arn, and regional_certificate_name"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_certificate_chain" {
  description = "(Optional) Certificate for the CA that issued the certificate, along with any intermediate CA certificates required to create an unbroken chain to a certificate trusted by the intended API clients. Only valid for EDGE endpoint configuration type. Conflicts with certificate_arn, regional_certificate_arn, and regional_certificate_name"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_certificate_name" {
  description = "(Optional) Unique name to use when registering this certificate as an IAM server certificate. Conflicts with certificate_arn, regional_certificate_arn, and regional_certificate_name. Required if certificate_arn is not set"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_certificate_private_key" {
  description = "(Optional) Private key associated with the domain certificate given in certificate_body. Only valid for EDGE endpoint configuration type. Conflicts with certificate_arn, regional_certificate_arn, and regional_certificate_name"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_domain_name" {
  description = "(Required) Fully-qualified domain name to register"
  type        = string
}
variable "api_gateway_domain_name_endpoint_access_mode" {
  description = "(Optional) Endpoint access mode of the DomainName. Only available for domain names that use security policies that start with SecurityPolicy_. Valid values: BASIC, STRICT"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_ownership_verification_certificate_arn" {
  description = "(Optional) ARN of the AWS-issued certificate used to validate custom domain ownership (when certificate_arn is issued via an ACM Private CA or mutual_tls_authentication is configured with an ACM-imported certificate.)"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_policy" {
  description = "(Optional) Stringified JSON policy document that applies to the execute-api service for this DomainName regardless of the caller and Method configuration. Supported only for private custom domain names"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_regional_certificate_arn" {
  description = "(Optional) ARN for an AWS-managed certificate. AWS Certificate Manager is the only supported source. Used when a regional domain name is desired. Conflicts with certificate_arn, certificate_name, certificate_body, certificate_chain, and certificate_private_key"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_regional_certificate_name" {
  description = "(Optional) User-friendly name of the certificate that will be used by regional endpoint for this domain name. Conflicts with certificate_arn, certificate_name, certificate_body, certificate_chain, and certificate_private_key"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_routing_mode" {
  description = "(Optional) Mode to route traffic for the domain name. Valid values: BASE_PATH_MAPPING_ONLY, ROUTING_RULE_ONLY, ROUTING_RULE_THEN_BASE_PATH_MAPPING"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_security_policy" {
  description = "(Optional) TLS version + cipher suite for this DomainName. Must be configured to perform drift detection. For a list of valid security policies, see DomainName in the Amazon API Gateway API Reference"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "api_gateway_domain_name_endpoint_configuration" {
  description = "(Optional) Configuration block defining API endpoint information including type"
  type        = list(object({
    ip_address_type = optional(string)
    types           = list(string)
  }))
  default     = []
}
variable "api_gateway_domain_name_mutual_tls_authentication" {
  description = "(Optional) Mutual TLS authentication configuration for the domain name"
  type        = list(object({
    truststore_uri     = string
    truststore_version = optional(string)
  }))
  default     = []
}
