resource "aws_guardduty_member" "guardduty_member" {
  account_id                 = var.guardduty_member_account_id
  detector_id                = var.guardduty_member_detector_id
  disable_email_notification = var.guardduty_member_disable_email_notification
  email                      = var.guardduty_member_email
  invitation_message         = var.guardduty_member_invitation_message
  invite                     = var.guardduty_member_invite
}
