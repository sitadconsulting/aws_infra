resource "aws_sns_sms_preferences" "sns_sms_preferences" {
  default_sender_id                     = var.sns_sms_preferences_default_sender_id
  default_sms_type                      = var.sns_sms_preferences_default_sms_type
  delivery_status_iam_role_arn          = var.sns_sms_preferences_delivery_status_iam_role_arn
  delivery_status_success_sampling_rate = var.sns_sms_preferences_delivery_status_success_sampling_rate
  monthly_spend_limit                   = var.sns_sms_preferences_monthly_spend_limit
  usage_report_s3_bucket                = var.sns_sms_preferences_usage_report_s3_bucket
}
