resource "aws_guardduty_member_detector_feature" "guardduty_member_detector_feature" {
  account_id  = var.guardduty_member_detector_feature_account_id
  detector_id = var.guardduty_member_detector_feature_detector_id
  name        = var.guardduty_member_detector_feature_name
  status      = var.guardduty_member_detector_feature_status
  
  dynamic "additional_configuration" {
    for_each = var.guardduty_member_detector_feature_additional_configuration
      content {
        name   = additional_configuration.value["name"]
        status = additional_configuration.value["status"]
      }
  }
}
