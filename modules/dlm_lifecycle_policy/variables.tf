variable "dlm_lifecycle_policy_description" {
  description = "(Required) A description for the DLM lifecycle policy"
  type        = string
}
variable "dlm_lifecycle_policy_execution_role_arn" {
  description = "(Required) The ARN of an IAM role that is able to be assumed by the DLM service"
  type        = string
}
variable "dlm_lifecycle_policy_default_policy" {
  description = "(Required) Specify the type of default policy to create. valid values are VOLUME or INSTANCE"
  type        = string
}
variable "dlm_lifecycle_policy_state" {
  description = "(Optional) Whether the lifecycle policy should be enabled or disabled. ENABLED or DISABLED are valid values. Defaults to ENABLED"
  type        = string
  default     = null
}
variable "dlm_lifecycle_policy_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "dlm_lifecycle_policy_policy_details" {
  description = "(Required) Policy_details configuration block "
  type        = list(object({
    copy_tags          = optional(bool)
    create_interval    = optional(number)
    extend_deletion    = optional(bool)
    policy_language    = optional(string)
    policy_type        = optional(string)
    resource_locations = optional(list(string))
    resource_type      = optional(string)
    resource_types     = optional(list(string))
    retain_interval    = optional(number)
    target_tags        = optional(map(string))
    action             = optional(list(object({
      name              = string
      cross_region_copy = list(object({
        target                   = string
        encryption_configuration = list(object({
          cmk_arn   = optional(string)
          encrypted = optional(bool)
        }))
        retain_rule              = optional(list(object({
          interval      = number
          interval_unit = string
        })), [])
      }))
    })), [])
    event_source       = optional(list(object({
      type       =  string
      parameters = list(object({
        description_regex = string
        event_type        = string
        snapshot_owner    = list(string)
      }))
    })), [])
    exclusions         = optional(list(object({
      exclude_boot_volumes = optional(bool)
      exclude_tags         = optional(map(string))
      exclude_volume_types = optional(list(string))
    })), [])
    parameters         = optional(list(object({
      exclude_boot_volume      = optional(bool)
      exclude_data_volume_tags = optional(map(string))
      no_reboot                = optional(bool)
    })), [])
    schedule           = optional(list(object({
      copy_tags              = optional(bool)
      name                   = string
      tags_to_add            = optional(map(string))
      variable_tags          = optional(map(string))
      archive_rule           = optional(list(object({
        archive_retain_rule = list(object({
          retention_archive_tier = list(object({
            count         = optional(number)
            interval      = optional(number)
            interval_unit = optional(string)
          })) 
        }))
      })), [])
      create_rule            = list(object({
        cron_expression = optional(string)
        interval        = optional(number)
        interval_unit   = optional(string)
        location        = optional(string)
        times           = optional(list(string))
        scripts         = optional(list(object({
          execute_operation_on_script_failure = optional(bool)
          execution_handler                   = string
          execution_handler_service           = optional(string)
          execution_timeout                   = optional(number)
          maximum_retry_count                 = optional(number)
          stages                              = optional(list(string))
        })), [])
      }))
      cross_region_copy_rule = optional(list(object({
        cmk_arn        = optional(string)
        copy_tags      = optional(bool)
        encrypted      = bool
        target         = optional(string)
        target_region  = optional(string)
        deprecate_rule = optional(list(object({
          interval      = number
          interval_unit = string
        })), [])
        retain_rule    = optional(list(object({
          interval      = number
          interval_unit = string
        })), [])
      })), [])
      deprecate_rule         = optional(list(object({
        count         = optional(number)
        interval      = optional(number)
        interval_unit = optional(string)
      })), [])
      fast_restore_rule      = optional(list(object({
        availability_zones = list(string)
        count              = optional(number)
        interval           = optional(number)
        interval_unit      = optional(string)
      })), [])
      retain_rule            = list(object({
        count         = optional(number)
        interval      = optional(number)
        interval_unit = optional(string)
      })) 
      share_rule             = optional(list(object({
        target_accounts       = list(string)
        unshare_interval      = optional(number)
        unshare_interval_unit = optional(string)
      })), [])
    })), [])
  }))
}
