variable "detective_member_account_id" {
  description = "(Required) AWS account ID for the account"
  type        = string
}
variable "detective_member_disable_email_notification" {
  description = "(Optional) If set to true, then the root user of the invited account will not receive an email notification. This notification is in addition to an alert that the root user receives in AWS Personal Health Dashboard. By default, this is set to false"
  type        = bool
  default     = false
}
variable "detective_member_email_address" {
  description = "(Required) Email address for the account"
  type        = string
}
variable "detective_member_graph_arn" {
  description = "(Required) ARN of the behavior graph to invite the member accounts to contribute their data to"
  type        = string
}
variable "detective_member_message" {
  description = "(Optional) A custom message to include in the invitation. Amazon Detective adds this message to the standard content that it sends for an invitation."
  type        = string
  default     = null
}
