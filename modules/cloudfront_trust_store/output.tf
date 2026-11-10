output "cloudfront_trust_store_arn" {
  description = "ARN of the trust store"
  value       = element(concat(aws_cloudfront_trust_store.cloudfront_trust_store.*.arn, [""]), 0)
}
output "cloudfront_trust_store_etag" {
  description = "ETag of the trust store"
  value       = element(concat(aws_cloudfront_trust_store.cloudfront_trust_store.*.etag, [""]), 0)
}
output "cloudfront_trust_store_id" {
  description = "ID of the trust store"
  value       = element(concat(aws_cloudfront_trust_store.cloudfront_trust_store.*.id, [""]), 0)
}
output "cloudfront_trust_store_number_of_ca_certificates" {
  description = "Number of CA certificates in the trust store"
  value       = element(concat(aws_cloudfront_trust_store.cloudfront_trust_store.*.number_of_ca_certificates, [""]), 0)
}
