resource "aws_db_event_subscription" "db_event_subscription" {
  enabled          = var.db_event_subscription_enabled
  event_categories = var.db_event_subscription_event_categories
  name             = var.db_event_subscription_name
  sns_topic        = var.db_event_subscription_sns_topic
  source_ids       = var.db_event_subscription_source_ids
  source_type      = var.db_event_subscription_source_type
}
