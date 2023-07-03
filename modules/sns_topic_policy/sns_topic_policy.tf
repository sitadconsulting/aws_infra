resource "aws_sns_topic_policy" "sns_topic_policy" {
  arn    = var.sns_topic_policy_arn
  policy = var.sns_topic_policy_policy
}
