resource "aws_macie2_member" "macie2_member" {
  account_id                            = var.macie2_member_account_id
  email                                 = var.macie2_member_email
  invitation_disable_email_notification = var.macie2_member_invitation_disable_email_notification
  invitation_message                    = var.macie2_member_invitation_message
  invite                                = var.macie2_member_invite
  status                                = var.macie2_member_status
  tags                                  = var.macie2_member_tags
}
