resource "aws_macie2_invitation_accepter" "macie2_invitation_accepter" {
  administrator_account_id = var.macie2_invitation_accepter_administrator_account_id
}
