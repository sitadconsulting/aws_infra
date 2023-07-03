variable "acm_certificate_domain_name" {
  description = "Domain name for which the certificate should be issued"
  type        = string
}
variable "acm_certificate_subject_alternative_names" {
  description = "Set of domains that should be SANs in the issued certificate. To remove all elements of a previously configured list, set this value equal to an empty list"
  type        = list(string)
  default     = []
}
variable "acm_certificate_validation_method" {
  description = "Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform"
  type        = string
  default     = null
}
variable "acm_certificate_key_algorithm" {
  description = "Specifies the algorithm of the public and private key pair that your Amazon issued certificate uses to encrypt data"
  type        = string
  default     = ""
}
variable "acm_certificate_private_key" {
  description = "Certificate's PEM-formatted private key" 
  type        = string
  default     = null
}
variable "acm_certificate_certificate_body" {
  description = "Certificate's PEM-formatted public key"
  type        = string
  default     = null
}
variable "acm_certificate_certificate_chain" {
  description = "Certificate's PEM-formatted chain"
  type        = string
  default     = null
}
variable "acm_certificate_certificate_authority_arn" {
  description = "ARN of an ACM PCA"
  type        = string
  default     = null
}
variable "acm_certificate_early_renewal_duration" {
  description = "Amount of time to start automatic renewal process before expiration. Has no effect if less than 60 days"
  type        = string
  default     = null
}
variable "acm_certificate_tags" {
  description = "Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "acm_certificate_options" {
  description = "used to set certificate options" 
  type        = list(object({
    certificate_transparency_logging_preference = optional(string)
  }))
  default = []
}
variable "acm_certificate_validation_option" {
  description = "used to specify information about the initial validation of each domain name"
  type        = list(object({
    domain_name       = string
    validation_domain = string
  }))
  default = []
}
