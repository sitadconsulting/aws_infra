variable "iam_signing_certificate_certificate_body" {
  description = "(Required) The contents of the signing certificate in PEM-encoded format"
  type        = string
}
variable "iam_signing_certificate_status" {
  description = "(Optional) The status you want to assign to the certificate. Active means that the certificate can be used for programmatic calls to Amazon Web Services Inactive means that the certificate cannot be used"
  type        = string
  default     = null
}
variable "iam_signing_certificate_user_name" {
  description = "(Required) The name of the user the signing certificate is for"
  type        = string
}
