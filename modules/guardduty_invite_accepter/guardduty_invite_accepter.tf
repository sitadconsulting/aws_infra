resource "aws_guardduty_invite_accepter" "guardduty_invite_accepter" {
  detector_id       = var.guardduty_invite_accepter_detector_id
  master_account_id = var.guardduty_invite_accepter_master_account_id
}
