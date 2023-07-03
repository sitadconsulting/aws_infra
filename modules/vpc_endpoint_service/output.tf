output "vpc_endpoint_service_id" {
  description = "The ID of the VPC endpoint service"
  value       = element(concat(aws_vpc_endpoint_service.vpc_endpoint_service.*.id, [""]), 0)
}
output "vpc_endpoint_service_availability_zones" {
  description = "A set of Availability Zones in which the service is available"
  value       = element(concat(aws_vpc_endpoint_service.vpc_endpoint_service.*.availability_zones, [""]), 0)
}
output "vpc_endpoint_service_arn" {
  description = "ARN of the VPC endpoint service"
  value       = element(concat(aws_vpc_endpoint_service.vpc_endpoint_service.*.arn, [""]), 0)
}
output "vpc_endpoint_service_base_endpoint_dns_names" {
  description = "A set of DNS names for the service"
  value       = element(concat(aws_vpc_endpoint_service.vpc_endpoint_service.*.base_endpoint_dns_names, [""]), 0)
}
output "vpc_endpoint_service_manages_vpc_endpoints" {
  description = "Whether or not the service manages its VPC endpoints"
  value       = element(concat(aws_vpc_endpoint_service.vpc_endpoint_service.*.manages_vpc_endpoints, [""]), 0)
}
output "vpc_endpoint_service_service_name" {
  description = "The service name"
  value       = element(concat(aws_vpc_endpoint_service.vpc_endpoint_service.*.service_name, [""]), 0)
}
output "vpc_endpoint_service_service_type" {
  description = "The service type, Gateway or Interface"
  value       = element(concat(aws_vpc_endpoint_service.vpc_endpoint_service.*.service_type, [""]), 0)
}
output "vpc_endpoint_service_state" {
  description = "The state of the VPC endpoint service"
  value       = element(concat(aws_vpc_endpoint_service.vpc_endpoint_service.*.state, [""]), 0)
}
output "vpc_endpoint_service_private_dns_configuration" {
  description = "List of objects containing information about the endpoint service private DNS name configuration"
  value       = element(concat(aws_vpc_endpoint_service.vpc_endpoint_service.*.private_dns_configuration, [""]), 0)
}
output "vpc_endpoint_service_id" {
  description = "The ID of the VPC endpoint service"
  value       = element(concat(aws_vpc_endpoint_service.vpc_endpoint_service.*.id, [""]), 0)
}
output "vpc_endpoint_service_id" {
  description = "The ID of the VPC endpoint service"
  value       = element(concat(aws_vpc_endpoint_service.vpc_endpoint_service.*.id, [""]), 0)
}
