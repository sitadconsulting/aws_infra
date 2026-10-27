variable "acm_certificate_domain_name" {
  description = "(Required) Domain name for which the certificate should be issued"
  type        = string
}
variable "acm_certificate_subject_alternative_names" {
  description = "Optional) Set of domains that should be SANs in the issued certificate. To remove all elements of a previously configured list, set this value equal to an empty list ([]) or use the terraform taint command to trigger recreation"
  type        = list(string)
  default     = null
}
variable "acm_certificate_validation_method" {
  description = "(Optional) Which method to use for validation. DNS or EMAIL are valid. This parameter must not be set for certificates that were imported into ACM and then into Terraform"
  type        = string
  default     = null
}
variable "acm_certificate_key_algorithm" {
  description = "(Optional) Specifies the algorithm of the public and private key pair that your Amazon issued certificate uses to encrypt data"
  type        = string
  default     = null
}
variable "acm_certificate_private_key" {
  description = "(Optional) Certificate's PEM-formatted private key. Conflicts with private_key_wo"
  type        = string
  default     = null
}
variable "acm_certificate_private_key_wo" {
  description = "(Optional, Write-Only) Certificate's PEM-formatted private key. Conflicts with private_key. If set, requires private_key_wo_version to be set"
  type        = string
  default     = null
}
variable "acm_certificate_private_key_wo_version" {
  description = "(Optional) Required when private_key_wo is set. Changing this value triggers an update to private_key_wo"
  type        = string
  default     = null
}
variable "acm_certificate_certificate_body" {
  description = "(Required) Certificate's PEM-formatted public key"
  type        = string
  default     = null
}
variable "acm_certificate_certificate_chain" {
  description = "(Optional) Certificate's PEM-formatted chain"
  type        = string
  default     = null
}
variable "acm_certificate_certificate_authority_arn" {
  description = "(Required) ARN of an ACM PCA"
  type        = string
  default     = null
}
variable "acm_certificate_early_renewal_duration" {
  description = "(Optional) Amount of time to start automatic renewal process before expiration. Has no effect if less than 60 days. Represented by either a subset of RFC 3339 duration supporting years, months, and days (e.g., P90D), or a string such as 2160h"
  type        = string
  default     = null
}
variable "acm_certificate_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "acm_certificate_options" {
  description = "(Optional) Configuration block used to set certificate options"
  type        = list(object({
    certificate_transparency_logging_preference = optional(string)
    export                                      = optional(string)
  }))
  default = []
}
variable "acm_certificate_validation_option" {
  description = "(Optional) Configuration block used to specify information about the initial validation of each domain name"
  type        = list(object({
    domain_name       = string
    validation_domain = string
  }))
  default = []
}
