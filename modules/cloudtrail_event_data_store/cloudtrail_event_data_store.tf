resource "aws_cloudtrail_event_data_store" "cloudtrail_event_data_store" {
  billing_mode                   = var.cloudtrail_event_data_store_billing_mode
  kms_key_id                     = var.cloudtrail_event_data_store_kms_key_id
  multi_region_enabled           = var.cloudtrail_event_data_store_multi_region_enabled
  name                           = var.cloudtrail_event_data_store_name
  organization_enabled           = var.cloudtrail_event_data_store_organization_enabled
  retention_period               = var.cloudtrail_event_data_store_retention_period
  suspend                        = var.cloudtrail_event_data_store_suspend
  tags                           = var.cloudtrail_event_data_store_tags
  termination_protection_enabled = var.cloudtrail_event_data_store_termination_protection_enabled 

  dynamic "advanced_event_selector" {
    for_each = var.cloudtrail_event_data_store_advanced_event_selector
      content {
        name = advanced_event_selector.value["name"]
        dynamic "field_selector" {
          for_each = advanced_event_selector.value.field_selector
            content {
              ends_with       = field_selector.value["ends_with"]
              equals          = field_selector.value["equals"]
              field           = field_selector.value["field"]
              not_ends_with   = field_selector.value["not_ends_with"]
              not_equals      = field_selector.value["not_equals"]
              not_starts_with = field_selector.value["not_starts_with"]
              starts_with     = field_selector.value["starts_with"]
            }
        }
      }
  }
}
