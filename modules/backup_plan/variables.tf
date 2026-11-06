variable "backup_plan_name" {
  description = "(Required) Display name of a backup plan"
  type        = string
}
variable "backup_plan_tags" {
  description = "(Optional) Metadata that you can assign to help organize the plans you create"
  type        = map(string)
  default     = {}
}
variable "backup_plan_advanced_backup_setting" {
  description = "(Optional) Object that specifies backup options for each resource type"
  type        = list(object({
    backup_options = map(string)
    resource_type  = string
  }))
  default     = []
}
variable "backup_plan_rule" {
  description = "(Required) Rule that specifies a scheduled task used to back up a selection of resources"
  type        = list(object({
    completion_window                            = optional(number)
    enable_continuous_backup                     = optional(bool)  
    recovery_point_tags                          = optional(map(string))
    rule_name                                    = string
    schedule                                     = optional(string)
    schedule_expression_timezone                 = optional(string) 
    start_window                                 = optional(number)
    target_logically_air_gapped_backup_vault_arn = optional(string)
    target_vault_name                            = string
    copy_action                                  = optional(list(object({
      destination_vault_arn = string
      lifecycle             = optional(list(object({
        cold_storage_after                        = optional(number)
        delete_after                              = optional(number)
        opt_in_to_archive_for_supported_resources = optional(bool)
      })), [])
    })), [])
    lifecycle                                    = optional(list(object({
      cold_storage_after                        = optional(number)
      delete_after                              = optional(number)
      opt_in_to_archive_for_supported_resources = optional(bool)
    })), [])
    scan_action                                  = optional(list(object({
      malware_scanner = string
      scan_mode       = string
    })), [])
  }))
}
variable "backup_plan_scan_setting" {
  description = "(Optional) Block for scanning configuration for the backup rule and includes the malware scanner, and scan mode of either full or incremental"
  type        = list(object({
    malware_scanner  = string
    resource_types   = list(string)
    scanner_role_arn = string
  }))
  default     = []
}
