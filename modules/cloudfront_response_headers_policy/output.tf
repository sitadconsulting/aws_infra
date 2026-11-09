output "cloudfront_response_headers_policy_arn" {
  description = "The response headers policy ARN"
  value       = element(concat(aws_cloudfront_response_headers_policy.cloudfront_response_headers_policy.*.arn, [""]), 0)
}
output "cloudfront_response_headers_policy_etag" {
  description = "The current version of the response headers policy"
  value       = element(concat(aws_cloudfront_response_headers_policy.cloudfront_response_headers_policy.*.etag, [""]), 0)
}
output "cloudfront_response_headers_policy_id" {
  description = "The identifier for the response headers policy"
  value       = element(concat(aws_cloudfront_response_headers_policy.cloudfront_response_headers_policy.*.id, [""]), 0)
}
