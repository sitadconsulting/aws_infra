resource "aws_guardduty_organization_configuration_feature" "guardduty_organization_configuration_feature" {
  auto_enable = var.guardduty_organization_configuration_feature_auto_enable
  detector_id = var.guardduty_organization_configuration_feature_detector_id
  name        = var.guardduty_organization_configuration_feature_name
    

  dynamic "additional_configuration" {
    for_each = var.guardduty_organization_configuration_feature_additional_configuration
      content {
        auto_enable = additional_configuration.value["auto_enable"]
        name        = additional_configuration.value["name"]
      }
  }
}
