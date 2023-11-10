output "api_gateway_domain_name_arn" {
  description = "Domain name ARN"
  value       = element(concat(aws_api_gateway_domain_name.api_gateway_domain_name.*.arn, [""]), 0)
}
output "api_gateway_domain_name_certificate_upload_date" {
  description = "Upload date associated with the domain certificate"
  value       = element(concat(aws_api_gateway_domain_name.api_gateway_domain_name.*.certificate_upload_date, [""]), 0)
}
output "api_gateway_domain_name_cloudfront_domain_name" {
  description = "Hostname created by Cloudfront to represent the distribution that implements this domain name mapping"
  value       = element(concat(aws_api_gateway_domain_name.api_gateway_domain_name.*.cloudfront_domain_name, [""]), 0)
}
output "api_gateway_domain_name_cloudfront_zone_id" {
  description = "For convenience, the hosted zone ID (Z2FDTNDATAQYW2) that can be used to create a Route53 alias record for the distribution"
  value       = element(concat(aws_api_gateway_domain_name.api_gateway_domain_name.*.cloudfront_zone_id, [""]), 0)
}
output "api_gateway_domain_name_id" {
  description = "Internal identifier assigned to this domain name by API Gateway"
  value       = element(concat(aws_api_gateway_domain_name.api_gateway_domain_name.*.id, [""]), 0)
}
output "api_gateway_domain_name_regional_domain_name" {
  description = "Hostname for the custom domain's regional endpoint"
  value       = element(concat(aws_api_gateway_domain_name.api_gateway_domain_name.*.regional_domain_name, [""]), 0)
}
output "api_gateway_domain_name_regional_zone_id" {
  description = "Hosted zone ID that can be used to create a Route53 alias record for the regional endpoint"
  value       = element(concat(aws_api_gateway_domain_name.api_gateway_domain_name.*.regional_zone_id, [""]), 0)
}
