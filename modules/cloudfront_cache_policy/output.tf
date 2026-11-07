output "cloudfront_cache_policy_arn" {
  description = "The cache policy ARN"
  value       = element(concat(aws_cloudfront_cache_policy.cloudfront_cache_policy.*.arn, [""]), 0)
}
output "cloudfront_cache_policy_etag" {
  description = "Current version of the cache policy"
  value       = element(concat(aws_cloudfront_cache_policy.cloudfront_cache_policy.*.etag, [""]), 0)
}
output "cloudfront_cache_policy_id" {
  description = "Identifier for the cache policy"
  value       = element(concat(aws_cloudfront_cache_policy.cloudfront_cache_policy.*.id, [""]), 0)
}
