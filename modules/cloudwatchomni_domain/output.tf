output "cloudwatchomni_domain_arn" {
  description = "ARN of the domain"
  value       = element(concat(aws_cloudwatchomni_domain.cloudwatchomni_domain.*.arn, [""]), 0)
}
output "cloudwatchomni_domain_custom_endpoint_urls" {
  description = "Additional endpoint URLs derived from the domain name"
  value       = element(concat(aws_cloudwatchomni_domain.cloudwatchomni_domain.*.custom_endpoint_urls, [""]), 0)
}
output "cloudwatchomni_domain_domain_endpoint_url" {
  description = "HTTPS endpoint URL for accessing the domain"
  value       = element(concat(aws_cloudwatchomni_domain.cloudwatchomni_domain.*.domain_endpoint_url, [""]), 0)
}
output "cloudwatchomni_domain_domain_id" {
  description = "Unique identifier of the domain"
  value       = element(concat(aws_cloudwatchomni_domain.cloudwatchomni_domain.*.domain_id, [""]), 0)
}
output "cloudwatchomni_domain_identity_center_application_arn" {
  description = "ARN of the IAM Identity Center application. Only set when identity_providers includes IDC"
  value       = element(concat(aws_cloudwatchomni_domain.cloudwatchomni_domain.*.identity_center_application_arn, [""]), 0)
}
