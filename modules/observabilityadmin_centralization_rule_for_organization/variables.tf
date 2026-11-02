variable "observabilityadmin_centralization_rule_for_organization_rule_name" {
  description = "(Required) Name of the centralization rule. Must be unique within the organization"
  type        = string
}
variable "observabilityadmin_centralization_rule_for_organization_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "observabilityadmin_centralization_rule_for_organization_rule" {
  description = "(Required) Configuration block for the centralization rule"
  type        = list(object({
    destination = list(object({
      account                           = string
      region                            = string
      destination_logs_configuration    = optional(list(object({
        backup_configuration          = optional(list(object({
          kms_key_arn = optional(string)
          region      = optional(string)
        })), [])
        log_group_name_configuration  = optional(list(object({
          log_group_name_pattern = string
        })), [])
        logs_encryption_configuration = optional(list(object({
          encryption_conflict_resolution_strategy = optional(string)
          encryption_scope                        = optional(string)
          encryption_strategy                     = string
          kms_key_arn                             = optional(string)
        })), [])
        tag_propagation_configuration = optional(list(object({
           destination_role_arn             = string
           tag_conflict_resolution_strategy = optional(string)
        })), [])
      })), [])
      destination_metrics_configuration = optional(list(object({
        backup_configuration = optional(list(object({
          region = string
        })), [])
      })), [])
    }))
    source = list(object({
      regions                      = list(string)
      scope                        = string
      source_logs_configuration    = optional(list(object({
        data_source_selection_criteria = optional(string)
        encrypted_log_group_strategy   = string
        log_group_selection_criteria   = optional(string)
      })), [])
      source_metrics_configuration = optional(list(object({
        metrics_selection_criteria = string
      })), [])
    }))
  }))
}
