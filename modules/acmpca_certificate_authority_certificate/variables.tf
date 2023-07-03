variable "certificate_authority_certificate_certificate" {
  description = "PEM-encoded certificate for the Certificate Authority"
  type        = string
}
variable "certificate_authority_certificate_certificate_authority_arn" {
  description = "ARN of the Certificate Authority"
  type        = string
}
variable "certificate_authority_certificate_certificate_chain" {
  description = "PEM-encoded certificate chain that includes any intermediate certificates and chains up to root CA"
  type        = string
  default     = ""
}
