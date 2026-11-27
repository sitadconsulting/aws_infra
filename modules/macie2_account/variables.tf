variable "macie2_account_finding_publishing_frequency" {
  description = "(Optional) How often to publish updates to policy findings for the account. This includes publishing updates to AWS Security Hub and Amazon EventBridge (formerly called Amazon CloudWatch Events). Valid values are FIFTEEN_MINUTES, ONE_HOUR or SIX_HOURS"
  type        = string
}
variable "macie2_account_status" {
  description = "(Optional) Status for the account. To enable Amazon Macie and start all Macie activities for the account, set this value to ENABLED. Valid values are ENABLED or PAUSED"
  type        = string
  default     = null
}
