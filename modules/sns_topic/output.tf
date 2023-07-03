output "sns_topic_id" {
  description = "The ARN of the SNS topic"
  value       = element(concat(aws_sns_topic.sns_topic.*.id, [""]), 0)
}
output "sns_topic_arn" {
  description = "The ARN of the SNS topic, as a more obvious property (clone of id)"
  value       = element(concat(aws_sns_topic.sns_topic.*.arn, [""]), 0)
}
output "sns_topic_owner" {
  description = "The AWS Account ID of the SNS topic owner"
  value       = element(concat(aws_sns_topic.sns_topic.*.owner, [""]), 0)
}
