variable "api_gateway_domain_name_certificate_arn" {
  description = "ARN for an AWS-managed certificate. AWS Certificate Manager is the only supported source. Used when an edge-optimized domain name is desired. Conflicts with certificate_name, certificate_body, certificate_chain, certificate_private_key, regional_certificate_arn, and regional_certificate_name"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_certificate_body" {
  description = "Certificate issued for the domain name being registered, in PEM format. Only valid for EDGE endpoint configuration type. Conflicts with certificate_arn, regional_certificate_arn, and regional_certificate_name"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_certificate_chain" {
  description = "Certificate for the CA that issued the certificate, along with any intermediate CA certificates required to create an unbroken chain to a certificate trusted by the intended API clients. Only valid for EDGE endpoint configuration type. Conflicts with certificate_arn, regional_certificate_arn, and regional_certificate_name"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_certificate_name" {
  description = "Unique name to use when registering this certificate as an IAM server certificate. Conflicts with certificate_arn, regional_certificate_arn, and regional_certificate_name. Required if certificate_arn is not set"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_certificate_private_key" {
  description = "Private key associated with the domain certificate given in certificate_body. Only valid for EDGE endpoint configuration type. Conflicts with certificate_arn, regional_certificate_arn, and regional_certificate_name"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_domain_name" {
  description = "Fully-qualified domain name to register"
  type        = string
}
variable "api_gateway_domain_name_ownership_verification_certificate_arn" {
  description = "ARN of the AWS-issued certificate used to validate custom domain ownership (when certificate_arn is issued via an ACM Private CA or mutual_tls_authentication is configured with an ACM-imported certificate.)"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_regional_certificate_arn" {
  description = "ARN for an AWS-managed certificate. AWS Certificate Manager is the only supported source. Used when a regional domain name is desired. Conflicts with certificate_arn, certificate_name, certificate_body, certificate_chain, and certificate_private_key"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_regional_certificate_name" {
  description = "User-friendly name of the certificate that will be used by regional endpoint for this domain name. Conflicts with certificate_arn, certificate_name, certificate_body, certificate_chain, and certificate_private_key"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_security_policy" {
  description = "Transport Layer Security (TLS) version + cipher suite for this DomainName. Valid values are TLS_1_0 and TLS_1_2. Must be configured to perform drift detection"
  type        = string
  default     = null
}
variable "api_gateway_domain_name_tags" {
  description = "Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "api_gateway_domain_name_endpoint_configuration" {
  description = "Configuration block defining API endpoint information including type"
  type        = list(object({
    types = list(string)
  }))
  default     = []
}
variable "api_gateway_domain_name_mutual_tls_authentication" {
  description = "Mutual TLS authentication configuration for the domain name"
  type        = list(object({
    truststore_uri     = string
    truststore_version = optional(string)
  }))
  default     = []
}
