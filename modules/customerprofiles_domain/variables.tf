variable "customerprofiles_domain_dead_letter_queue_url" {
  description = "(Optional) The URL of the SQS dead letter queue, which is used for reporting errors associated with ingesting data from third party applications"
  type        = string
  default     = null
}
variable "customerprofiles_domain_default_encryption_key" {
  description = "(Optional) The default encryption key, which is an AWS managed key, is used when no specific type of encryption key is specified. It is used to encrypt all data before it is placed in permanent or semi-permanent storage"
  type        = string
  default     = null
}
variable "customerprofiles_domain_default_expiration_days" {
  description = "(Required) The default number of days until the data within the domain expires"
  type        = number
}
variable "customerprofiles_domain_domain_name" {
  description = "(Required) The name for your Customer Profile domain. It must be unique for your AWS account"
  type        = strihg
}
variable "customerprofiles_domain_tags" {
  description = "(Optional) Tags to apply to the domain"
  type        = map(string)
  default     = {}
}
variable "customerprofiles_domain_matching" {
  description = "(Optional) A block that specifies the process of matching duplicate profiles"
  type        = list(object({
    enabled          = bool
    auto_merging     = optional(list(object({
      enabled                                  = bool
      min_allowed_confidence_score_for_merging = optional(number)
      conflict_resolution                      = optional(list(object({
        conflict_resolving_model = string
        source_name              = optional(string)
      })), [])
      consolidation                            = optional(list(object({
        matching_attributes_list = list(string)
      })), [])
    })), [])
    exporting_config = optional(list(object({
      s3_exporting_config = optional(list(object({
        s3_bucket_name = string
        s3_key_name    = optional(string)
      })), [])
    })), [])
    job_schedule     = optional(list(object({
      day_of_the_week = string
      time            = string
    })), [])
  }))
  default     = []
}
variable "customerprofiles_domain_rule_based_matching" {
  description = "(Optional) A block that specifies the process of matching duplicate profiles using the Rule-Based matching"
  type        = list(object({
    enabled                             = bool
    max_allowed_rule_level_for_matching = optional(number)
    max_allowed_rule_level_for_merging  = optional(number)
    attribute_types_selector            = optional(list(object({
      address                  = optional(string)
      attribute_matching_model = string
      email_address            = optional(list(string))
      phone_number             = optional(list(string))
    })), [])
    conflict_resolution                 = optional(list(object({
      conflict_resolving_model = string
      source_name              = optional(string)
    })), [])
    exporting_config                    = optional(list(object({
      s3_exporting_config = optional(list(object({
        s3_bucket_name = string
        s3_key_name    = optional(string)
      })), [])
    })), [])
    matching_rules                      = optional(list(object({
      rule = list(string)
    })), [])
  }))
  default     = []
}
