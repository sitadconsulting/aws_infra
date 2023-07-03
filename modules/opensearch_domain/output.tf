output "opensearch_domain_arn" {
  description = "ARN of the domain"
  value       = element(concat(aws_opensearch_domain.opensearch_domain.*.arn, [""]), 0)
}
output "opensearch_domain_domain_id" {
  description = "Unique identifier for the domain"
  value       = element(concat(aws_opensearch_domain.opensearch_domain.*.domain_id, [""]), 0)
}
output "opensearch_domain_domain_name" {
  description = "Name of the OpenSearch domain"
  value       = element(concat(aws_opensearch_domain.opensearch_domain.*.domain_name, [""]), 0)
}
output "opensearch_domain_endpoint" {
  description = "Domain-specific endpoint used to submit index, search, and data upload requests"
  value       = element(concat(aws_opensearch_domain.opensearch_domain.*.endpoint, [""]), 0)
}
output "opensearch_domain_dashboard_endpoint" {
  description = "Domain-specific endpoint for Dashboard without https scheme"
  value       = element(concat(aws_opensearch_domain.opensearch_domain.*.dashboard_endpoint, [""]), 0)
}
output "opensearch_domain_vpc_options.0.availability_zones" {
  description = "If the domain was created inside a VPC, the names of the availability zones the configured subnet_ids were created inside"
  value       = element(concat(aws_opensearch_domain.opensearch_domain.*.vpc_options.0.availability_zones, [""]), 0)
}
output "opensearch_domain_vpc_options.0.vpc_id" {
  description = "If the domain was created inside a VPC, the ID of the VPC"
  value       = element(concat(aws_opensearch_domain.opensearch_domain.*.vpc_options.0.vpc_id, [""]), 0)
}
