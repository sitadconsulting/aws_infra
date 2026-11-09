output "cloudfront_function_arn" {
  description = "ARN identifying your CloudFront Function"
  value       = element(concat(aws_cloudfront_function.cloudfront_function.*.arn, [""]), 0)
}
output "cloudfront_function_etag" {
  description = "ETag hash of the function. This is the value for the DEVELOPMENT stage of the function"
  value       = element(concat(aws_cloudfront_function.cloudfront_function.*.etag, [""]), 0)
}
output "cloudfront_function_live_stage_etag" {
  description = "ETag hash of any LIVE stage of the function"
  value       = element(concat(aws_cloudfront_function.cloudfront_function.*.live_stage_etag, [""]), 0)
}
output "cloudfront_function_status" {
  description = "Status of the function. Can be UNPUBLISHED, UNASSOCIATED or ASSOCIATED"
  value       = element(concat(aws_cloudfront_function.cloudfront_function.*.status, [""]), 0)
}
