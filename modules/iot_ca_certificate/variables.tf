variable "iot_ca_certificate_active" {
  description = "(Required) Boolean flag to indicate if the certificate should be active for device authentication"
  type        = bool
}
variable "iot_ca_certificate_allow_auto_registration" {
  description = "(Required) Boolean flag to indicate if the certificate should be active for device registration"
  type        = bool
}
variable "iot_ca_certificate_ca_certificate_pem" {
  description = "(Required) PEM encoded CA certificate"
  type        = string
}
variable "iot_ca_certificate_certificate_mode" {
  description = "(Optional) The certificate mode in which the CA will be registered. Valid values: DEFAULT and SNI_ONLY. Default: DEFAULT"
  type        = string
  default     = null
}
variable "iot_ca_certificate_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "iot_ca_certificate_verification_certificate_pem" {
  description = "(Optional) PEM encoded verification certificate containing the common name of a registration code. Review CreateVerificationCSR. Required if certificate_mode is DEFAULT"
  type        = string
  default     = null
}
variable "iot_ca_certificate_registration_config" {
  description = "(Optional) Information about the registration configuration"
  type        = list(object({
    role_arn      = optional(string)
    template_body = optional(string)
    template_name = optional(string)
  }))
  default     = []
}
