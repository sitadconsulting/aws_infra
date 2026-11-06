variable "backup_region_settings_resource_type_management_preference" {
  description = "(Optional) Map of service names to their full management preferences for the Region"
  type        = map(bool)
  default     = {}
}
variable "backup_region_settings_resource_type_opt_in_preference" {
  description = "(Required) Map of service names to their opt-in preferences for the Region"
  type        = map(bool)
}
