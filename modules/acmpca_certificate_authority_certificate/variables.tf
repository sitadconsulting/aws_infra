variable "acmpca_certificate_authority_certificate_certificate" {
  description = "(Required) PEM-encoded certificate for the Certificate Authority"
  type        = string
}
variable "acmpca_certificate_authority_certificate_certificate_authority_arn" {
  description = "(Required) ARN of the Certificate Authority"
  type        = string
}
variable "acmpca_certificate_authority_certificate_certificate_chain" {
  description = "(Optional) PEM-encoded certificate chain that includes any intermediate certificates and chains up to root CA. Required for subordinate Certificate Authorities. Not allowed for root Certificate Authorities"
  type        = string
  default     = null
}
