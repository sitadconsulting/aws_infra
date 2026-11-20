resource "aws_guardduty_publishing_destination" "guardduty_publishing_destination" {
  destination_arn  = var.guardduty_publishing_destination_destination_arn
  destination_type = var.guardduty_publishing_destination_destination_type
  detector_id      = var.guardduty_publishing_destination_detector_id
  kms_key_arn      = var.guardduty_publishing_destination_kms_key_arn
  tags             = var.guardduty_publishing_destination_tags
}
