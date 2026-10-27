output "api_gateway_domain_name_access_association_arn" {
  description = "ARN of the domain name access association"
  value       = element(concat(aws_api_gateway_domain_name_access_association.api_gateway_domain_name_access_association.*.arn, [""]), 0)
}
