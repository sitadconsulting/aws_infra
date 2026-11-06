variable "backup_logically_air_gapped_vault_encryption_key_arn" {
  description = "(Optional) AWS KMS key identifier (ARN) used to encrypt the backups in the logically air-gapped vault"
  type        = string
  default     = null
}
variable "backup_logically_air_gapped_vault_max_retention_days" {
  description = "(Required) Maximum retention period that the Logically Air Gapped Backup Vault retains recovery points"
  type        = number
}
variable "backup_logically_air_gapped_vault_min_retention_days" {
  description = "(Required) Minimum retention period that the Logically Air Gapped Backup Vault retains recovery points"
  type        = number
}
variable "backup_logically_air_gapped_vault_name" {
  description = "(Required) Name of the Logically Air Gapped Backup Vault to create"
  type        = string
}
variable "backup_logically_air_gapped_vault_tags" {
  description = "(Optional) Metadata that you can assign to help organize the resources that you create"
  type        = map(string)
  default     = {}
}
