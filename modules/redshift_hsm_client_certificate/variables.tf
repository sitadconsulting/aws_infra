variable "redshift_hsm_client_certificate_hsm_client_certificate_identifier" {
  description = "The identifier of the HSM client certificate"
  type        = string
}
variable "redshift_hsm_client_certificate_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
