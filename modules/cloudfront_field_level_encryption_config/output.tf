output "cloudfront_field_level_encryption_config_arn" {
  description = "The Field Level Encryption Config ARN"
  value       = element(concat(aws_cloudfront_field_level_encryption_config.cloudfront_field_level_encryption_config.*.arn, [""]), 0)
}
output "cloudfront_field_level_encryption_config_caller_reference" {
  description = "Internal value used by CloudFront to allow future updates to the Field Level Encryption Config"
  value       = element(concat(aws_cloudfront_field_level_encryption_config.cloudfront_field_level_encryption_config.*.caller_reference, [""]), 0)
}
output "cloudfront_field_level_encryption_config_etag" {
  description = "The current version of the Field Level Encryption Config. For example: E2QWRUHAPOMQZL"
  value       = element(concat(aws_cloudfront_field_level_encryption_config.cloudfront_field_level_encryption_config.*.etag, [""]), 0)
}
output "cloudfront_field_level_encryption_config_id" {
  description = "The identifier for the Field Level Encryption Config. For example: K3D5EWEUDCCXON"
  value       = element(concat(aws_cloudfront_field_level_encryption_config.cloudfront_field_level_encryption_config.*.id, [""]), 0)
}
