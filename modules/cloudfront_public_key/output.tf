output "cloudfront_public_key_caller_reference" {
  description = "Internal value used by CloudFront to allow future updates to the public key configuration"
  value       = element(concat(aws_cloudfront_public_key.cloudfront_public_key.*.caller_reference, [""]), 0)
}
output "cloudfront_public_key_etag" {
  description = "The current version of the public key. For example: E2QWRUHAPOMQZL"
  value       = element(concat(aws_cloudfront_public_key.cloudfront_public_key.*.etag, [""]), 0)
}
output "cloudfront_public_key_id" {
  description = "The identifier for the public key. For example: K3D5EWEUDCCXON"
  value       = element(concat(aws_cloudfront_public_key.cloudfront_public_key.*.id, [""]), 0)
}
