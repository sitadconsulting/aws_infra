output "cloudfront_vpc_origin_arn" {
  description = "The VPC origin ARN"
  value       = element(concat(aws_cloudfront_vpc_origin.cloudfront_vpc_origin.*.arn, [""]), 0)
}
output "cloudfront_vpc_origin_etag" {
  description = "The current version of the origin"
  value       = element(concat(aws_cloudfront_vpc_origin.cloudfront_vpc_origin.*.etag, [""]), 0)
}
output "cloudfront_vpc_origin_id" {
  description = "The VPC origin ID"
  value       = element(concat(aws_cloudfront_vpc_origin.cloudfront_vpc_origin.*.id, [""]), 0)
}
