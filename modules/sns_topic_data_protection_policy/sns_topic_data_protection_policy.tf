resource "aws_sns_topic_data_protection_policy" "sns_topic_data_protection_policy" {
  arn    = var.sns_topic_data_protection_policy_arn
  policy = var.sns_topic_data_protection_policy_policy 
}
