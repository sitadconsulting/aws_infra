output "cloudfront_distribution_arn" {
  description = "ARN for the distribution. For example: arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5, where 123456789012 is your AWS account ID"
  value       = element(concat(aws_cloudfront_distribution.cloudfront_distribution.*.arn, [""]), 0)
}
eutput "cloudfront_distribution_id" {
  description = " Identifier for the distribution. For example: EDFDVBD632BHDS5"
  value       = element(concat(aws_cloudfront_distribution.cloudfront_distribution.*.id, [""]), 0)
}
output "cloudfront_distribution_caller_reference" {
  description = "Internal value used by CloudFront to allow future updates to the distribution configuration"
  value       = element(concat(aws_cloudfront_distribution.cloudfront_distribution.*.caller_reference, [""]), 0)
}
output "cloudfront_distribution_logging_v1_enabled" {
  description = "Whether V1 logging is enabled for the distribution"
  value       = element(concat(aws_cloudfront_distribution.cloudfront_distribution.*.logging_v1_enabled, [""]), 0)
}
output "cloudfront_distribution_status" {
  description = "Current status of the distribution. Deployed if the distribution's information is fully propagated throughout the Amazon CloudFront system"
  value       = element(concat(aws_cloudfront_distribution.cloudfront_distribution.*.status, [""]), 0)
}
output "cloudfront_distribution_trusted_key_groups" {
  description = "List of nested attributes for active trusted key groups, if the distribution is set up to serve private content with signed URLs"
  value       = element(concat(aws_cloudfront_distribution.cloudfront_distribution.*.trusted_key_groups, [""]), 0)
}
output "cloudfront_distribution_trusted_signers" {
  description = "List of nested attributes for active trusted signers, if the distribution is set up to serve private content with signed URLs"
  value       = element(concat(aws_cloudfront_distribution.cloudfront_distribution.*.trusted_signers, [""]), 0)
}
output "cloudfront_distribution_domain_name" {
  description = "Domain name corresponding to the distribution. For example: d604721fxaaqy9.cloudfront.net"
  value       = element(concat(aws_cloudfront_distribution.cloudfront_distribution.*.domain_name, [""]), 0)
}
output "cloudfront_distribution_last_modified_time" {
  description = "Date and time the distribution was last modified"
  value       = element(concat(aws_cloudfront_distribution.cloudfront_distribution.*.last_modified_time, [""]), 0)
}
output "cloudfront_distribution_in_progress_validation_batches" {
  description = "Number of invalidation batches currently in progress"
  value       = element(concat(aws_cloudfront_distribution.cloudfront_distribution.*.in_progress_validation_batches, [""]), 0)
}
output "cloudfront_distribution_etag" {
  description = "Current version of the distribution's information. For example: E2QWRUHAPOMQZL"
  value       = element(concat(aws_cloudfront_distribution.cloudfront_distribution.*.etag, [""]), 0)
}
output "cloudfront_distribution_hosted_zone_id" {
  description = "CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to. This attribute is simply an alias for the zone ID Z2FDTNDATAQYW2"
  value       = element(concat(aws_cloudfront_distribution.cloudfront_distribution.*.hosted_zone_id, [""]), 0)
}
