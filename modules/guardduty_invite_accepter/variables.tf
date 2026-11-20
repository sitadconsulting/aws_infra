variable "guardduty_invite_accepter_detector_id" {
  description = "(Required) Detector ID of the member GuardDuty account"
  type        = string
}
variable "guardduty_invite_accepter_master_account_id" {
  description = "(Required) AWS account ID for primary account"
  type        = string
}
