resource "aws_macie2_account" "macie2_account" {
  finding_publishing_frequency = var.macie2_account_finding_publishing_frequency
  status                       = var.macie2_account_status
}
