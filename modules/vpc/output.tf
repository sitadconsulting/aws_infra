output "vpc_arn" {
  description = "ARN of VPC"
  value       = element(concat(aws_vpc.vpc.*.arn, [""]), 0)
}
output "vpc_default_network_acl_id" {
  description = "ID of the network ACL created by default on VPC creation"
  value       = element(concat(aws_vpc.vpc.*.default_network_acl_id, [""]), 0)
}
output "vpc_default_route_table_id" {
  description = "ID of the route table created by default on VPC creation"
  value       = element(concat(aws_vpc.vpc.*.default_route_table_id, [""]), 0)
}
output "vpc_default_security_group_id" {
  description = "ID of the security group created by default on VPC creation"
  value       = element(concat(aws_vpc.vpc.*.default_security_group_id, [""]), 0)
}
output "vpc_dhcp_options_id" {
  description = "DHCP options ID of the desired VPC"
  value       = element(concat(aws_vpc.vpc.*.dhcp_options_id, [""]), 0)
}
output "vpc_enable_dns_hostnames" {
  description = "Whether the VPC has DNS hostname support"
  value       = element(concat(aws_vpc.vpc.*.enable_dns_hostnames, [""]), 0)
}
output "vpc_enable_dns_support" {
  description = "Whether the VPC has DNS support"
  value       = element(concat(aws_vpc.vpc.*.enable_dns_support, [""]), 0)
}
output "vpc_enable_network_address_usage_metrics" {
  description = "Whether Network Address Usage metrics are enabled for the VPC"
  value       = element(concat(aws_vpc.vpc.*.enable_network_address_usage_metrics, [""]), 0)
}
output "vpc_id" {
  description = "ID of the VPC"
  value       = element(concat(aws_vpc.vpc.*.id, [""]), 0)
}
output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = element(concat(aws_vpc.vpc.*.instance_tenancy, [""]), 0)
}
output "vpc_ipv6_association_id" {
  description = "Association ID for the IPv6 CIDR block"
  value       = element(concat(aws_vpc.vpc.*.ipv6_association_id, [""]), 0)
}
output "vpc_ipv6_cidr_block_network_border_group" {
  description = "Network Border Group Zone name"
  value       = element(concat(aws_vpc.vpc.*.ipv6_cidr_block_network_border_group, [""]), 0)
}
output "vpc_main_route_table_id" {
  description = "ID of the main route table associated with this VPC. Note that you can change a VPC's main route table by using an aws_main_route_table_association"
  value       = element(concat(aws_vpc.vpc.*.main_route_table_id, [""]), 0)
}
output "vpc_owner_id" {
  description = " ID of the AWS account that owns the VPC"
  value       = element(concat(aws_vpc.vpc.*.owner_id, [""]), 0)
}
