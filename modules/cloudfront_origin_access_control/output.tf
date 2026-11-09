output "cloudfront_origin_access_control_arn" {
  description = "The Origin Access Control ARN"
  value       = element(concat(aws_cloudfront_origin_access_control.cloudfront_origin_access_control.*.arn, [""]), 0)
}
output "cloudfront_origin_access_control_id" {
  description = "The unique identifier of this Origin Access Control"
  value       = element(concat(aws_cloudfront_origin_access_control.cloudfront_origin_access_control.*.id, [""]), 0)
}
output "cloudfront_origin_access_control_etag" {
  description = "The current version of this Origin Access Control"
  value       = element(concat(aws_cloudfront_origin_access_control.cloudfront_origin_access_control.*.etag, [""]), 0)
}
