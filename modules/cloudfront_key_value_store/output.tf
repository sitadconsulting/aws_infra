output "cloudfront_key_value_store_arn" {
  description = "ARN identifying your CloudFront KeyValueStore"
  value       = element(concat(aws_cloudfront_key_value_store.cloudfront_key_value_store.*.arn, [""]), 0)
}
output "cloudfront_key_value_store_etag" {
  description = "ETag hash of the KeyValueStore"
  value       = element(concat(aws_cloudfront_key_value_store.cloudfront_key_value_store.*.etag, [""]), 0)
}
output "cloudfront_key_value_store_id" {
  description = "A unique identifier for the KeyValueStore"
  value       = element(concat(aws_cloudfront_key_value_store.cloudfront_key_value_store.*.id, [""]), 0)
}
