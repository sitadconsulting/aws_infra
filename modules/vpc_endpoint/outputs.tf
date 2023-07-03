output "vpc_endpoint_id" {
  description = "The ID of the VPC endpoint"
  value       = element(concat(aws_vpc_endpoint.vpc_endpoint.*.id, [""]), 0)
}
output "vpc_endpoint_arn" {
  description = "ARN of the VPC endpoint"
  value       = element(concat(aws_vpc_endpoint.vpc_endpoint.*.arn, [""]), 0)
}
output "vpc_endpoint_cidr_blocks" {
  description = "The list of CIDR blocks for the exposed AWS service. Applicable for endpoints of type Gateway"
  value       = element(concat(aws_vpc_endpoint.vpc_endpoint.*.cidr_blocks, [""]), 0)
}
output "vpc_endpoint_dns_entry" {
  description = "The DNS entries for the VPC Endpoint. Applicable for endpoints of type Interface"
  value       = element(concat(aws_vpc_endpoint.vpc_endpoint.*.dns_entry, [""]), 0)
}
output "vpc_endpoint_network_interface_id" {
  description = "One or more network interfaces for the VPC Endpoint. Applicable for endpoints of type Interface"
  value       = element(concat(aws_vpc_endpoint.vpc_endpoint.*.network_interface_id, [""]), 0)
}
output "vpc_endpoint_owner_id" {
  description = "The ID of the AWS account that owns the VPC endpoint"
  value       = element(concat(aws_vpc_endpoint.vpc_endpoint.*.owner_id, [""]), 0)
}
output "vpc_endpoint_prefix_list_id" {
  description = "The prefix list ID of the exposed AWS service. Applicable for endpoints of type Gateway"
  value       = element(concat(aws_vpc_endpoint.vpc_endpoint.*.prefix_list_id, [""]), 0)
}
output "vpc_endpoint_state" {
  description = "The state of the VPC endpoint"
  value       = element(concat(aws_vpc_endpoint.vpc_endpoint.*.state, [""]), 0)
}
