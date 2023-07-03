resource "aws_sns_topic" "sns_topic" {
  application_success_feedback_role_arn    = var.sns_topic_application_success_feedback_role_arn
  application_success_feedback_sample_rate = var.sns_topic_application_success_feedback_sample_rate
  application_failure_feedback_role_arn    = var.sns_topic_application_failure_feedback_role_arn
  content_based_deduplication              = var.sns_topic_content_based_deduplication
  delivery_policy                          = var.sns_topic_delivery_policy
  display_name                             = var.sns_topic_display_name
  fifo_topic                               = var.sns_topic_fifo_topic
  firehose_failure_feedback_role_arn       = var.sns_topic_firehose_failure_feedback_role_arn
  firehose_success_feedback_role_arn       = var.sns_topic_firehose_success_feedback_role_arn
  firehose_success_feedback_sample_rate    = var.sns_topic_firehose_success_feedback_sample_rate
  http_failure_feedback_role_arn           = var.sns_topic_http_failure_feedback_role_arn
  http_success_feedback_role_arn           = var.sns_topic_http_success_feedback_role_arn
  http_success_feedback_sample_rate        = var.sns_topic_http_success_feedback_sample_rate
  kms_master_key_id                        = var.sns_topic_kms_master_key_id
  lambda_failure_feedback_role_arn         = var.sns_topic_lambda_failure_feedback_role_arn
  lambda_success_feedback_role_arn         = var.sns_topic_lambda_success_feedback_role_arn
  lambda_success_feedback_sample_rate      = var.sns_topic_lambda_success_feedback_sample_rate
  name                                     = var.sns_topic_name
  name_prefix                              = var.sns_topic_name_prefix
  policy                                   = var.sns_topic_policy
  signature_version                        = var.sns_topic_signature_version
  sqs_failure_feedback_role_arn            = var.sns_topic_sqs_failure_feedback_role_arn
  sqs_success_feedback_role_arn            = var.sns_topic_sqs_success_feedback_role_arn
  sqs_success_feedback_sample_rate         = var.sns_topic_sqs_success_feedback_sample_rate
  tracing_config                           = var.sns_topic_tracing_config
  tags                                     = var.sns_topic_tags
}
