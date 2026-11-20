resource "aws_guardduty_threatintelset" "guardduty_threatintelset" {
  activate    = var.guardduty_threatintelset_activate
  detector_id = var.guardduty_threatintelset_detector_id
  format      = var.guardduty_threatintelset_format
  location    = var.guardduty_threatintelset_location
  name        = var.guardduty_threatintelset_name
  tags        = var.guardduty_threatintelset_tags
}
