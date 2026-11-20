resource "aws_guardduty_detector_feature" "guardduty_detector_feature" {
  detector_id = var.guardduty_detector_feature_detector_id
  name        = var.guardduty_detector_feature_name
  status      = var.guardduty_detector_feature_status

  dynamic "additional_configuration" {
    for_each = var.guardduty_detector_feature_additional_configuration
      content {
        name   = additional_configuration.value["name"]
        status = additional_configuration.value["status"]
      }
  }
}
