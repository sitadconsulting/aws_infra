variable "acm_certificate_validation_certificate_arn" {
  description = "(Required) ARN of the certificate that is being validated"
  type        = string
}
variable "acm_certificate_validation_validation_record_fqdns" {
  description = "(Optional) List of FQDNs that implement the validation. Only valid for DNS validation method ACM certificates. If this is set, the resource can implement additional sanity checks and has an explicit dependency on the resource that is implementing the validation"
  type        = list(string)
  default     = null
}
