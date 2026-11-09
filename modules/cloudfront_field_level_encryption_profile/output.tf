output "cloudfront_field_level_encryption_profile_arn" {
  description = "The Field Level Encryption Profile ARN"
  value       = element(concat(aws_cloudfront_field_level_encryption_profile.cloudfront_field_level_encryption_profile.*.arn, [""]), 0)
}
output "cloudfront_field_level_encryption_profile_caller_reference" {
  description = "Internal value used by CloudFront to allow future updates to the Field Level Encryption Profile"
  value       = element(concat(aws_cloudfront_field_level_encryption_profile.cloudfront_field_level_encryption_profile.*.caller_reference, [""]), 0)
}
output "cloudfront_field_level_encryption_profile_etag" {
  description = "The current version of the Field Level Encryption Profile. For example: E2QWRUHAPOMQZL"
  value       = element(concat(aws_cloudfront_field_level_encryption_profile.cloudfront_field_level_encryption_profile.*.etag, [""]), 0)
}
output "cloudfront_field_level_encryption_profile_id" {
  description = "The identifier for the Field Level Encryption Profile. For example: K3D5EWEUDCCXON"
  value       = element(concat(aws_cloudfront_field_level_encryption_profile.cloudfront_field_level_encryption_profile.*.id, [""]), 0)
}
