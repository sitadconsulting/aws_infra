resource "aws_redshift_event_subscription" "redshift_event_subscription" {
  enabled          = var.redshift_event_subscription_enabled
  event_categories = var.redshift_event_subscription_event_categories
  name             = var.redshift_event_subscription_name
  severity         = var.redshift_event_subscription_severity
  sns_topic_arn    = var.redshift_event_subscription_sns_topic_arn
  source_ids       = var.redshift_event_subscription_source_ids
  source_type      = var.redshift_event_subscription_source_type
  tags             = var.redshift_event_subscription_tags 
}
