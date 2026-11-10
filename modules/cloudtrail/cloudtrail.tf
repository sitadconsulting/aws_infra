resource "aws_cloudtrail" "cloudtrail" {
  cloud_watch_logs_group_arn    = var.cloudtrail_cloud_watch_logs_group_arn
  cloud_watch_logs_role_arn     = var.cloudtrail_cloud_watch_logs_role_arn
  enable_log_file_validation    = var.cloudtrail_enable_log_file_validation
  enable_logging                = var.cloudtrail_enable_logging
  include_global_service_events = var.cloudtrail_include_global_service_events
  is_multi_region_trail         = var.cloudtrail_is_multi_region_trail
  is_organization_trail         = var.cloudtrail_is_organization_trail
  kms_key_id                    = var.cloudtrail_kms_key_id
  name                          = var.cloudtrail_name
  recursive_logging             = var.cloudtrail_recursive_logging
  s3_bucket_name                = var.cloudtrail_s3_bucket_name
  s3_key_prefix                 = var.cloudtrail_s3_key_prefix
  sns_topic_name                = var.cloudtrail_sns_topic_name
  tags                          = var.cloudtrail_tags

  dynamic "advanced_event_selector" {
    for_each = var.cloudtrail_advanced_event_selector
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
  dynamic "event_selector" {
    for_each = var.cloudtrail_event_selector
      content {
        exclude_management_event_sources = event_selector.value["exclude_management_event_sources"]
        include_management_events        = event_selector.value["include_management_events"]
        read_write_type                  = event_selector.value["read_write_type"]
        dynamic "data_resource" {
          for_each = event_selector.value.data_resource
            content {
              type   = data_resource.value["type"]
              values = data_resource.value["values"]
            }
        }
      }
  }
  dynamic "insight_selector" {
    for_each = var.cloudtrail_insight_selector
      content {
        insight_type = insight_selector.value["insight_type"]
      }
  }
}
