output "cloudfront_distribution_tenant_arn" {
  description = "ARN of the distribution tenant"
  value       = element(concat(aws_cloudfront_distribution_tenant.cloudfront_distribution_tenant.*.arn, [""]), 0)
}
output "cloudfront_distribution_tenant_id" {
  description = "ID of the distribution tenant"
  value       = element(concat(aws_cloudfront_distribution_tenant.cloudfront_distribution_tenant.*.id, [""]), 0)
}
output "cloudfront_distribution_tenant_status" {
  description = "Current status of the distribution tenant"
  value       = element(concat(aws_cloudfront_distribution_tenant.cloudfront_distribution_tenant.*.status, [""]), 0)
}
output "cloudfront_distribution_tenant_etag" {
  description = "Current version of the distribution tenant"
  value       = element(concat(aws_cloudfront_distribution_tenant.cloudfront_distribution_tenant.*.etag, [""]), 0)
}
