output "s3_bucket_website_configuration_id" {
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided"
  value       = element(concat(aws_s3_bucket_website_configuration.s3_bucket_website_configuration.*.id, [""]), 0)
}
output "s3_bucket_website_configuration_website_domain" {
  description = "Domain of the website endpoint. This is used to create Route 53 alias records"
  value       = element(concat(aws_s3_bucket_website_configuration.s3_bucket_website_configuration.*.website_domain, [""]), 0)
}
output "s3_bucket_website_configuration_website_endpoint" {
  description = "Website endpoint"
  value       = element(concat(aws_s3_bucket_website_configuration.s3_bucket_website_configuration.*.website_endpoint, [""]), 0)
}
