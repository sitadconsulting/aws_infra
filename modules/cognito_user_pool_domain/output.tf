output "cognito_user_pool_domain_aws_account_id" {
  description = "The AWS account ID for the user pool owner"
  value       = element(concat(aws_cognito_user_pool_domain.cognito_user_pool_domain.*.aws_account_id, [""]), 0)
}
output "cognito_user_pool_domain_cloudfront_distribution" {
  description = "The Amazon CloudFront endpoint (e.g. dpp0gtxikpq3y.cloudfront.net) that you use as the target of the alias that you set up with your Domain Name Service (DNS) provider"
  value       = element(concat(aws_cognito_user_pool_domain.cognito_user_pool_domain.*.cloudfront_distribution, [""]), 0)
}
output "cognito_user_pool_domain_cloudfront_distribution_arn" {
  description = "The URL of the CloudFront distribution. This is required to generate the ALIAS aws_route53_record"
  value       = element(concat(aws_cognito_user_pool_domain.cognito_user_pool_domain.*.cloudfront_distribution_arn, [""]), 0)
}
output "cognito_user_pool_domain_cloudfront_distribution_zone_id" {
  description = "The Route 53 hosted zone ID of the CloudFront distribution"
  value       = element(concat(aws_cognito_user_pool_domain.cognito_user_pool_domain.*.cloudfront_distribution_zone_id, [""]), 0)
}
output "cognito_user_pool_domain_s3_bucket" {
  description = "The S3 bucket where the static files for this domain are stored"
  value       = element(concat(aws_cognito_user_pool_domain.cognito_user_pool_domain.*.s3_bucket, [""]), 0)
}
output "cognito_user_pool_domain_version" {
  description = "The app version"
  value       = element(concat(aws_cognito_user_pool_domain.cognito_user_pool_domain.*.version, [""]), 0)
}
