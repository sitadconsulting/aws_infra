resource "aws_sns_topic_subscription" "sns_topic_subscription" {
  confirmation_timeout_in_minutes = var.sns_topic_subscription_confirmation_timeout_in_minutes
  delivery_policy                 = var.sns_topic_subscription_delivery_policy
  endpoint                        = var.sns_topic_subscription_endpoint
  endpoint_auto_confirms          = var.sns_topic_subscription_endpoint_auto_confirms
  filter_policy                   = var.sns_topic_subscription_filter_policy
  filter_policy_scope             = var.sns_topic_subscription_filter_policy_scope
  protocol                        = var.sns_topic_subscription_protocol
  raw_message_delivery            = var.sns_topic_subscription_raw_message_delivery
  redrive_policy                  = var.sns_topic_subscription_redrive_policy
  subscription_role_arn           = var.sns_topic_subscription_subscription_role_arn
  topic_arn                       = var.sns_topic_subscription_topic_arn
}
