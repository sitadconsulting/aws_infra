variable "iot_certificate_active" {
  description = "(Required) Boolean flag to indicate if the certificate should be active"
  type        = bool
}
variable "iot_certificate_csr" {
  description = "(Optional) The certificate signing request. Review CreateCertificateFromCsr for more information on generating a certificate from a certificate signing request (CSR). If none is specified both the certificate and keys will be generated, review CreateKeysAndCertificate for more information on generating keys and a certificate"
  type        = string
  default     = null
}
variable "iot_certificate_certificate_pem" {
  description = "(Optional) The certificate to be registered. If ca_pem is unspecified, review RegisterCertificateWithoutCA. If ca_pem is specified, review RegisterCertificate for more information on registering a certificate"
  type        = string
  default     = null
}
variable "iot_certificate_ca_pem" {
  description = "(Optional) The CA certificate for the certificate to be registered. If this is set, the CA needs to be registered with AWS IoT beforehand"
  type        = string
  default     = null
}
