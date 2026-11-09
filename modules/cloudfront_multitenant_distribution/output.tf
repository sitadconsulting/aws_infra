output "cloudfront_multitenant_distribution_arn" {
  description = "ARN for the distribution"
  value       = element(concat(aws_cloudfront_multitenant_distribution.cloudfront_multitenant_distribution.*.arn, [""]), 0)
}
output "cloudfront_multitenant_distribution_caller_reference" {
  description = "Internal value used by CloudFront to allow future updates to the distribution configuration"
  value       = element(concat(aws_cloudfront_multitenant_distribution.cloudfront_multitenant_distribution.*.caller_reference, [""]), 0)
}
output "cloudfront_multitenant_distribution_connection_mode" {
  description = "Connection mode for the distribution. Always set to tenant-only for multi-tenant distributions"
  value       = element(concat(aws_cloudfront_multitenant_distribution.cloudfront_multitenant_distribution.*.connection_mode, [""]), 0)
}
output "cloudfront_multitenant_distribution_domain_name" {
  description = "Domain name corresponding to the distribution"
  value       = element(concat(aws_cloudfront_multitenant_distribution.cloudfront_multitenant_distribution.*.domain_name, [""]), 0)
}
output "cloudfront_multitenant_distribution_etag" {
  description = "Current version of the distribution's information"
  value       = element(concat(aws_cloudfront_multitenant_distribution.cloudfront_multitenant_distribution.*.etag, [""]), 0)
}
output "cloudfront_multitenant_distribution_id" {
  description = "Identifier for the distribution"
  value       = element(concat(aws_cloudfront_multitenant_distribution.cloudfront_multitenant_distribution.*.id, [""]), 0)
}
output "cloudfront_multitenant_distribution_in_progress_invalidation_batches" {
  description = "Number of invalidation batches currently in progress"
  value       = element(concat(aws_cloudfront_multitenant_distribution.cloudfront_multitenant_distribution.*.in_progress_invalidation_batches, [""]), 0)
}
output "cloudfront_multitenant_distribution_last_modified_time" {
  description = "Date and time the distribution was last modified"
  value       = element(concat(aws_cloudfront_multitenant_distribution.cloudfront_multitenant_distribution.*.last_modified_time, [""]), 0)
}
output "cloudfront_multitenant_distribution_status" {
  description = "Current status of the distribution. Deployed if the distribution's information is fully propagated throughout the Amazon CloudFront system"
  value       = element(concat(aws_cloudfront_multitenant_distribution.cloudfront_multitenant_distribution.*.status, [""]), 0)
}
output "cloudfront_multitenant_distribution_active_trusted_key_groups" {
  description = "List of key groups that CloudFront can use to validate signed URLs or signed cookies"
  value       = element(concat(aws_cloudfront_multitenant_distribution.cloudfront_multitenant_distribution.*.active_trusted_key_groups, [""]), 0)
}
