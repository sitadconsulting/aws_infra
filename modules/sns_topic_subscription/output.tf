output "sns_topic_subscription_arn" {
  description = "ARN of the subscription"
  value       = element(concat(aws_sns_topic_subscription.sns_topic_subscription.*.arn, [""]), 0)
}
