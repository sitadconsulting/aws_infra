resource "aws_guardduty_ipset" "guardduty_ipset" {
  activate    = var.guardduty_ipset_activate
  detector_id = var.guardduty_ipset_detector_id
  format      = var.guardduty_ipset_format
  location    = var.guardduty_ipset_location
  name        = var.guardduty_ipset_name
  tags        = var.guardduty_ipset_tags
}
