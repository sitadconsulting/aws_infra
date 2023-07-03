resource "aws_sns_platform_application" "sns_platform_application" {
  apple_platform_team_id           = var.sns_platform_application_apple_platform_team_id
  apple_platform_bundle_id         = var.sns_platform_application_apple_platform_bundle_id
  event_delivery_failure_topic_arn = var.sns_platform_application_event_delivery_failure_topic_arn
  event_endpoint_created_topic_arn = var.sns_platform_application_event_endpoint_created_topic_arn
  event_endpoint_deleted_topic_arn = var.sns_platform_application_event_endpoint_deleted_topic_arn
  event_endpoint_updated_topic_arn = var.sns_platform_application_event_endpoint_updated_topic_arn
  failure_feedback_role_arn        = var.sns_platform_application_failure_feedback_role_arn
  name                             = var.sns_platform_application_name
  platform                         = var.sns_platform_application_platform
  platform_credential              = var.sns_platform_application_platform_credential
  platform_principal               = var.sns_platform_application_platform_principal
  success_feedback_role_arn        = var.sns_platform_application_success_feedback_role_arn
  success_feedback_sample_rate     = var.sns_platform_application_success_feedback_sample_rate
}
