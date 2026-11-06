variable "backup_vault_notifications_backup_vault_events" {
  description = "(Required) Array of events that indicate the status of jobs to back up resources to the backup vault"
  type        = list(string)
}
variable "backup_vault_notifications_backup_vault_name" {
  description = "(Required) Name of the backup vault to add notifications for"
  type        = string
}
variable "backup_vault_notifications_sns_topic_arn" {
  description = "(Required) ARN that specifies the topic for a backup vault’s events"
  type        = string
}
