variable "acm_certificate_validation_certificate_arn" {
  description = "ARN of the certificate that is being validated"
  type        = string
  default     = null
}
variable "acm_certificate_validation_validation_record_fqdns" {
  description = "List of FQDNs that implement the validation. Only valid for DNS validation method ACM certificates"
  type        = list(string)
  default     = []
}
