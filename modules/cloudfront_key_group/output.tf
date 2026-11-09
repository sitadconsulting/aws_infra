output "cloudfront_key_group_etag" {
  description = "The identifier for this version of the key group"
  value       = element(concat(aws_cloudfront_key_group.cloudfront_key_group.*.etag, [""]), 0)
}
output "cloudfront_key_group_id" {
  description = "The identifier for the key group"
  value       = element(concat(aws_cloudfront_key_group.cloudfront_key_group.*.id, [""]), 0)
}
