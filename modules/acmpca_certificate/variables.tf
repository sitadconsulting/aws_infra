variable "acmpca_certificate_api_passthrough" {
  description = "Specifies X.509 certificate information to be included in the issued certificate. To use with API Passthrough templates"
  type        = string
  default     = ""
}
variable "acmpca_certificate_certificate_authority_arn" {
  description = "ARN of the certificate authority"
  type        = string
}
variable "acmpca_certificate_certificate_signing_request" {
  description = "Certificate Signing Request in PEM format"
  type        = string
}
variable "acmpca_certificate_signing_algorithm" {
  description = "Algorithm to use to sign certificate requests. Valid values: SHA256WITHRSA, SHA256WITHECDSA, SHA384WITHRSA, SHA384WITHECDSA, SHA512WITHRSA, SHA512WITHECDSA"
  type        = string
}
variable "acmpca_certificate_template_arn" {
  description = "Template to use when issuing a certificate"
  type        = string
  default     = null
}
variable "acmpca_certificate_validity" {
  description = "Configures end of the validity period for the certificate"
  type        = list(object({
    type  = string
    value = string   
  }))
  default = []
}
