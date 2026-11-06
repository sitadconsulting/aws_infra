variable "backup_restore_testing_plan_name" {
  description = "(Required) Name of the restore testing plan. Must be between 1 and 50 characters long and contain only alphanumeric characters and underscores"
  type        = string
}
variable "backup_restore_testing_plan_schedule_expression" {
  description = "(Required) Schedule expression for the restore testing plan"
  type        = string
}
variable "backup_restore_testing_plan_schedule_expression_timezone" {
  description = "(Optional) Timezone for the schedule expression. If not provided, the state value will be used"
  type        = string
  default     = null
}
variable "backup_restore_testing_plan_start_window_hours" {
  description = "(Optional) Number of hours in the start window for the restore testing plan. Must be between 1 and 168"
  type        = number
  default     = null
}
variable "backup_restore_testing_plan_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "backup_restore_testing_plan_recovery_point_selection" {
  description = "(Required) Recovery point selection configuration"
  type        = list(object({
    algorithm             = string
    exclude_vaults        = optional(list(string))
    include_vaults        = list(string)
    recovery_point_types  = list(string)
    selection_window_days = optional(number)
  }))
}
