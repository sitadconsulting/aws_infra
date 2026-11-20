variable "guardduty_member_account_id" {
  description = "(Required) AWS account ID for member account"
  type        = string
}
variable "guardduty_member_detector_id" {
  description = "(Required) Detector ID of the GuardDuty account where you want to create member accounts"
  type        = string
}
variable "guardduty_member_disable_email_notification" {
  description = "(Optional) Boolean whether an email notification is sent to the accounts. Defaults to false"
  type        = bool
  default     = false
}
variable "guardduty_member_email" {
  description = "(Required) Email address for member account"
  type        = string
}
variable "guardduty_member_invitation_message" {
  description = "(Optional) Message for invitation"
  type        = string
  default     = null
}
variable "guardduty_member_invite" {
  description = "(Optional) Boolean whether to invite the account to GuardDuty as a member. Defaults to false. To detect if an invitation needs to be (re-)sent, the Terraform state value is true based on a relationship_status of Disabled, Enabled, Invited, or EmailVerificationInProgress"
  type        = bool
  default     = false
}
