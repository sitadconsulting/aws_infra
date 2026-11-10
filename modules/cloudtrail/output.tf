output "cloudtrail_arn" {
  description = "ARN of the trail"
  value       = element(concat(aws_cloudtrail.cloudtrail.*.arn, [""]), 0)
}
output "cloudtrail_home_region" {
  description = "Region in which the trail was created"
  value       = element(concat(aws_cloudtrail.cloudtrail.*.home_region, [""]), 0)
}
output "cloudtrail_id" {
  description = "ARN of the trail"
  value       = element(concat(aws_cloudtrail.cloudtrail.*.id, [""]), 0)
}
output "cloudtrail_sns_topic_arn" {
  description = "ARN of the Amazon SNS topic that CloudTrail uses to send notifications when log files are delivered"
  value       = element(concat(aws_cloudtrail.cloudtrail.*.sns_topic_arn, [""]), 0)
}
