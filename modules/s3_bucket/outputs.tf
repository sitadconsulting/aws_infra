#---------------------------------
# S3 bucket
#---------------------------------
output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = element(concat(aws_s3_bucket.s3_bucket.*.id, [""]), 0)
}
output "s3_bucket_arn" {
  description = "ARN of the bucket"
  value       = element(concat(aws_s3_bucket.s3_bucket.*.arn, [""]), 0)
}
output "s3_bucket_domain_name" {
  description = "Bucket domain name"
  value       = element(concat(aws_s3_bucket.s3_bucket.*.bucket_domain_name, [""]), 0)
}
output "s3_bucket_regional_domain_name" {
  description = "Bucket region-specific domain name"
  value       = element(concat(aws_s3_bucket.s3_bucket.*.bucket_regional_domain_name, [""]), 0)
}
output "s3_bucket_hosted_zone_id" {
  description = "Route 53 Hosted Zone ID for this bucket's region"
  value       = element(concat(aws_s3_bucket.s3_bucket.*.hosted_zone_id, [""]), 0)
}
output "s3_bucket_region" {
  description = "AWS region this bucket resides in"
  value       = element(concat(aws_s3_bucket.s3_bucket.*.region, [""]), 0)
}
