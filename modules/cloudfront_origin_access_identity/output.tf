output "cloudfront_origin_access_identity_arn" {
  description = "The origin access identity ARN"
  value       = element(concat(aws_cloudfront_origin_access_identity.cloudfront_origin_access_identity.*.arn, [""]), 0)
}
output "cloudfront_origin_access_identity_caller_reference" {
  description = " Internal value used by CloudFront to allow future updates to the origin access identity"
  value       = element(concat(aws_cloudfront_origin_access_identity.cloudfront_origin_access_identity.*.caller_reference, [""]), 0)
}
output "cloudfront_origin_access_identity_cloudfront_access_identity_path" {
  description = "A shortcut to the full path for the origin access identity to use in CloudFront"
  value       = element(concat(aws_cloudfront_origin_access_identity.cloudfront_origin_access_identity.*.cloudfront_access_identity_path, [""]), 0)
}
output "cloudfront_origin_access_identity_etag" {
  description = "The current version of the origin access identity's information. For example: E2QWRUHAPOMQZL"
  value       = element(concat(aws_cloudfront_origin_access_identity.cloudfront_origin_access_identity.*.etag, [""]), 0)
}
output "cloudfront_origin_access_identity_iam_arn" {
  description = "A pre-generated ARN for use in S3 bucket policies (see below). Example: arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E2QWRUHAPOMQZL"
  value       = element(concat(aws_cloudfront_origin_access_identity.cloudfront_origin_access_identity.*.iam_arn, [""]), 0)
}
output "cloudfront_origin_access_identity_id" {
  description = "The identifier for the origin access identity"
  value       = element(concat(aws_cloudfront_origin_access_identity.cloudfront_origin_access_identity.*.id, [""]), 0)
}
output "cloudfront_origin_access_identity_s3_canonical_user_id" {
  description = "The Amazon S3 canonical user ID for the origin access identity, which you use when giving the origin access identity read permission to an object in Amazon S3"
  value       = element(concat(aws_cloudfront_origin_access_identity.cloudfront_origin_access_identity.*.s3_canonical_user_id, [""]), 0)
}
