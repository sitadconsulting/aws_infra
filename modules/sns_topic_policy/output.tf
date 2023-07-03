output "sns_topic_policy_owner" {
  description = "The AWS Account ID of the SNS topic owner"
  value       = element(concat(aws_sns_topic_policy.sns_topic_policy.*.owner, [""]), 0)
}
