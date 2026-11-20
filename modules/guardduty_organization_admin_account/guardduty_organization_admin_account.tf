resource "aws_guardduty_organization_admin_account" "guardduty_organization_admin_account" {
  admin_account_id = var.guardduty_organization_admin_account_admin_account_id
}
