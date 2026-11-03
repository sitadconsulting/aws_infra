output "cloudwatchomni_access_grant_arn" {
  description = "ARN of the access grant"
  value       = element(concat(aws_cloudwatchomni_access_grant.cloudwatchomni_access_grant.*.arn, [""]), 0)
}
output "cloudwatchomni_access_grant_grant_id" {
  description = "Unique ID of the access grant"
  value       = element(concat(aws_cloudwatchomni_access_grant.cloudwatchomni_access_grant.*.grant_id, [""]), 0)
}
output "cloudwatchomni_access_grant_grant_type" {
  description = "Who manages the access grant"
  value       = element(concat(aws_cloudwatchomni_access_grant.cloudwatchomni_access_grant.*.grant_type, [""]), 0)
}
