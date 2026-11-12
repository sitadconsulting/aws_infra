resource "aws_dms_event_subscription" "dms_event_subscription" {
  enabled          = var.dms_event_subscription_enabled
  event_categories = var.dms_event_subscription_event_categories
  name             = var.dms_event_subscription_name
  sns_topic_arn    = var.dms_event_subscription_sns_topic_arn
  source_ids       = var.dms_event_subscription_source_ids
  source_type      = var.dms_event_subscription_source_type
  tags             = var.dms_event_subscription_tags
}
