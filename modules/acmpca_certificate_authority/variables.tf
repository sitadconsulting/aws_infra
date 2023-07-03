variable "certificate_authority_enabled" {
  description = "Whether the certificate authority is enabled or disabled. Defaults to true. Can only be disabled if the CA is in an ACTIVE state"
  type        = bool
  default     = true
}
variable "certificate_authority_usage_mode" {
  description = "Specifies whether the CA issues general-purpose certificates that typically require a revocation mechanism, or short-lived certificates that may optionally omit revocation because they expire quickly. Short-lived certificate validity is limited to seven days. Defaults to GENERAL_PURPOSE. Valid values: GENERAL_PURPOSE and SHORT_LIVED_CERTIFICATE"
  type        = string
  default     = "GENERAL_PURPOSE"
}
variable "certificate_authority_tags" {
  description = "Key-value map of user-defined tags that are attached to the certificate authority"
  type        = map(string)
  default     = {}
}
variable "certificate_authority_type" {
  description = "Type of the certificate authority. Defaults to SUBORDINATE. Valid values: ROOT and SUBORDINATE"
  type        = string
  default     = "SUBORDINATE"
}
variable "certificate_authority_key_storage_security_standard" {
  description = "Cryptographic key management compliance standard used for handling CA keys. Defaults to FIPS_140_2_LEVEL_3_OR_HIGHER. Valid values: FIPS_140_2_LEVEL_3_OR_HIGHER and FIPS_140_2_LEVEL_2_OR_HIGHER"
  type        = string
  default     = "FIPS_140_2_LEVEL_3_OR_HIGHER"
}
variable "certificate_authority_permanent_deletion_time_in_days" {
  description = "Number of days to make a CA restorable after it has been deleted, must be between 7 to 30 days, with default to 30 days"
  type        = number
  default     = 7
}
variable "certificate_authority_certificate_authority_configuration" {
  description = "Configuratin containing algorithms and certificate subject information"
  type        = list(object({
    key_algorithm     = string
    signing_algorithm = string
    subject           = list(object({
      common_name                  = optional(string)
      country                      = optional(string)
      distinguished_name_qualifier = optional(string)
      generation_qualifier         = optional(string)
      given_name                   = optional(string)
      initials                     = optional(string)
      locality                     = optional(string)
      organization                 = optional(string)
      organizational_unit          = optional(string)
      pseudonym                    = optional(string)
      state                        = optional(string)
      surname                      = optional(string)
      title                        = optional(string) 
    }))
  }))
  default = []
}
variable "certificate_authority_revocation_configuration" {
  description = "Configuration containing revocation information"
  type        = list(object({
    crl_configuration = optional(list(object({
      custom_cname       = optional(string)
      enabled            = optional(bool)
      expiration_in_days = optional(number)
      s3_bucket_name     = optional(string)
      s3_object_acl      = optional(string)
    })), [])
    ocsp_configuration = optional(list(object({
      enabled           = bool
      ocsp_custom_cname = optional(string)
    })), [])
  })) 
  default     = []
}
