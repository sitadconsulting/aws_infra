variable "backup_restore_testing_selection_iam_role_arn" {
  description = "(Required) ARN of the IAM role"
  type        = string
}
variable "backup_restore_testing_selection_name" {
  description = "(Required) Name of the backup restore testing selection"
  type        = string
}
variable "backup_restore_testing_selection_protected_resource_arns" {
  description = "(Optional) ARNs for the protected resources"
  type        = list(string)
  default     = null
}
variable "backup_restore_testing_selection_protected_resource_type" {
  description = "(Required) Type of the protected resource"
  type        = string
}
variable "backup_restore_testing_selection_restore_metadata_overrides" {
  description = "(Optional) Override certain restore metadata keys"
  type        = map(string)
  default     = {}
}
variable "backup_restore_testing_selection_restore_testing_plan_name" {
  description = "(Required) Name of the restore testing plan"
  type        = string
}
variable "backup_restore_testing_selection_validation_window_hours" {
  description = "(Optional) Amount of hours available to run a validation script on the data. Valid range is 1 to 168"
  type        = number 
  default     = null
}
variable "backup_restore_testing_selection_protected_resource_conditions" {
  description = "(Optional) Conditions for the protected resource"
  type        = list(object({
    string_equals     = optional(list(object({
      key   = string
      value = string
    })), [])
    string_not_equals = optional(list(object({
      key   = string
      value = string
    })), [])
  }))
  default     = []
}
