variable "backup_vault_lock_configuration_backup_vault_name" {
  description = "(Required) Name of the backup vault to add a lock configuration for"
  type        = string
}
variable "backup_vault_lock_configuration_changeable_for_days" {
  description = "(Optional) Number of days before the lock date. If omitted creates a vault lock in governance mode, otherwise it will create a vault lock in compliance mode"
  type        = number
  default     = null
}
variable "backup_vault_lock_configuration_max_retention_days" {
  description = "(Optional) Maximum retention period that the vault retains its recovery points"
  type        = number
  default     = null
}
variable "backup_vault_lock_configuration_min_retention_days" {
  description = "(Optional) Minimum retention period that the vault retains its recovery points"
  type        = number
  default     = null
}
