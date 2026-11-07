output "cloudfront_continuous_deployment_policy_arn" {
  description = "The continuous deployment policy ARN"
  value       = element(concat(aws_cloudfront_continuous_deployment_policy.cloudfront_continuous_deployment_policy.*.arn, [""]), 0)
}
output "cloudfront_continuous_deployment_policy_etag" {
  description = "Current version of the continuous distribution policy"
  value       = element(concat(aws_cloudfront_continuous_deployment_policy.cloudfront_continuous_deployment_policy.*.etag, [""]), 0)
}
output "cloudfront_continuous_deployment_policy_id" {
  description = "Identifier of the continuous deployment policy"
  value       = element(concat(aws_cloudfront_continuous_deployment_policy.cloudfront_continuous_deployment_policy.*.id, [""]), 0)
}
output "cloudfront_continuous_deployment_policy_last_modified_time" {
  description = "Date and time the continuous deployment policy was last modified"
  value       = element(concat(aws_cloudfront_continuous_deployment_policy.cloudfront_continuous_deployment_policy.*.last_modified_time, [""]), 0)
}
