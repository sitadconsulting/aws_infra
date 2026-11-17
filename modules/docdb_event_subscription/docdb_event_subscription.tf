resource "aws_docdb_event_subscription" "docdb_event_subscription" {
  enabled          = var.docdb_event_subscription_enabled
  event_categories = var.docdb_event_subscription_event_categories
  name             = var.docdb_event_subscription_name
  name_prefix      = var.docdb_event_subscription_name_prefix
  sns_topic        = var.docdb_event_subscription_sns_topic
  source_ids       = var.docdb_event_subscription_source_ids
  source_type      = var.docdb_event_subscription_source_type
}
