resource "aws_guardduty_detector" "guardduty_detector" {
  enable                       = var.guardduty_detector_enable
  finding_publishing_frequency = var.guardduty_detector_finding_publishing_frequency 
  tags                         = var.guardduty_detector_tags
}
