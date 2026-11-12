variable "dms_certificate_certificate_id" {
  description = "(Required) The certificate identifier"
  type        = string
}
variable "dms_certificate_certificate_pem" {
  description = "(Optional) The contents of the .pem X.509 certificate file for the certificate. Either certificate_pem or certificate_wallet must be set"
  type        = string
  default     = null
}
variable "dms_certificate_certificate_wallet" {
  description = "(Optional) The contents of the Oracle Wallet certificate for use with SSL, provided as a base64-encoded String. Either certificate_pem or certificate_wallet must be set"
  type        = string
  default     = null
}
variable "dms_certificate_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
