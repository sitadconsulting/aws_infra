output "cloudfront_origin_request_policy_arn" {
  description = "The origin request policy ARN"
  value       = element(concat(aws_cloudfront_origin_request_policy.cloudfront_origin_request_policy.*.arn, [""]), 0)
}
output "cloudfront_origin_request_policy_etag" {
  description = "The current version of the origin request policy"
  value       = element(concat(aws_cloudfront_origin_request_policy.cloudfront_origin_request_policy.*.etag, [""]), 0)
}
output "cloudfront_origin_request_policy_id" {
  description = "The identifier for the origin request policy"
  value       = element(concat(aws_cloudfront_origin_request_policy.cloudfront_origin_request_policy.*.id, [""]), 0)
}
