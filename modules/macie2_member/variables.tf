variable "macie2_member_account_id" {
  description = "(Required) AWS account ID for the account"
  type        = string
}
variable "macie2_member_email" {
  description = "(Required) Email address for the account"
  type        = string
}
variable "macie2_member_invitation_disable_email_notification" {
  description = "(Optional) Whether to send an email notification to the root user of each account that the invitation will be sent to. This notification is in addition to an alert that the root user receives in AWS Personal Health Dashboard. To send an email notification to the root user of each account, set this value to true"
  type        = bool
  default     = null
}
variable "macie2_member_invitation_message" {
  description = "(Optional) Custom message to include in the invitation. Amazon Macie adds this message to the standard content that it sends for an invitation"
  type        = string
  default     = null
}
variable "macie2_member_invite" {
  description = "(Optional) Whether to send an invitation to a member"
  type        = bool
  default     = null
}
variable "macie2_member_status" {
  description = "(Optional) Status for the account. To enable Amazon Macie and start all Macie activities for the account, set this value to ENABLED. Valid values are ENABLED or PAUSED"
  type        = string
  default     = null
}
variable "macie2_member_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
