output "cloudfront_connection_function_connection_function_arn" {
  description = "ARN of the connection function"
  value       = element(concat(aws_cloudfront_connection_function.cloudfront_connection_function.*.connection_function_arn, [""]), 0)
}
output "cloudfront_connection_function_etag" {
  description = "ETag of the connection function"
  value       = element(concat(aws_cloudfront_connection_function.cloudfront_connection_function.*.etag, [""]), 0)
}
output "cloudfront_connection_function_id" {
  description = "ID of the connection function"
  value       = element(concat(aws_cloudfront_connection_function.cloudfront_connection_function.*.id, [""]), 0)
}
output "cloudfront_connection_function_live_stage_etag" {
  description = "ETag of the function's LIVE stage. Will be empty if the function has not been published"
  value       = element(concat(aws_cloudfront_connection_function.cloudfront_connection_function.*.live_stage_etag, [""]), 0)
}
output "cloudfront_connection_function_status" {
  description = "Status of the connection function"
  value       = element(concat(aws_cloudfront_connection_function.cloudfront_connection_function.*.status, [""]), 0)
}
