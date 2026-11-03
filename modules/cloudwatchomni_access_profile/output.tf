output "cloudwatchomni_access_profile_arn" {
  description = "ARN of the access profile"
  value       = element(concat(aws_cloudwatchomni_access_profile.cloudwatchomni_access_profile.*.arn, [""]), 0)
}
output "cloudwatchomni_access_profile_assume_status" {
  description = "Whether the calling principal can assume the access profile. Valid values: ALLOWED, DENIED"
  value       = element(concat(aws_cloudwatchomni_access_profile.cloudwatchomni_access_profile.*.assume_status, [""]), 0)
}
output "cloudwatchomni_access_profile_profile_id" {
  description = "Unique identifier of the access profile"
  value       = element(concat(aws_cloudwatchomni_access_profile.cloudwatchomni_access_profile.*.profile_id, [""]), 0)
}
output "cloudwatchomni_access_profile_profile_type" {
  description = "Who manages the access profile. Valid values: CUSTOMER_MANAGED, SERVICE_MANAGED"
  value       = element(concat(aws_cloudwatchomni_access_profile.cloudwatchomni_access_profile.*.profile_type, [""]), 0)
}
