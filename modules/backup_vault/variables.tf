variable "backup_vault_force_destroy" {
  description = "(Optional) Whether to delete all recovery points stored in the vault so that the vault can be destroyed without error. Default value: false"
  type        = bool
  default     = false
}
variable "backup_vault_kms_key_arn" {
  description = "(Optional) Server-side encryption key that is used to protect your backups"
  type        = string
  default     = null
}
variable "backup_vault_name" {
  description = "(Required) Name of the backup vault to create"
  type        = string
}
variable "backup_vault_tags" {
  description = "(Optional) Metadata that you can assign to help organize the resources that you create"
  type        = map(string)
  default     = {}
}
