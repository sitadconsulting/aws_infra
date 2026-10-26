output "vpc_ipv6_cidr_block_association_id" {
  description = "ID of the VPC CIDR association"
  value       = element(concat(aws_vpc_ipv6_cidr_block_association.vpc_ipv6_cidr_block_association.*.id, [""]), 0)
}
output "vpc_ipv6_cidr_block_association_ip_source" {
  description = "Source that allocated the IP address space. Values: amazon, byoip, none"
  value       = element(concat(aws_vpc_ipv6_cidr_block_association.vpc_ipv6_cidr_block_association.*.ip_source, [""]), 0)
}
output "vpc_ipv6_cidr_block_association_ipv6_address_attribute" {
  description = "Public IPv6 addresses are those advertised on the internet from AWS. Private IP addresses are not and cannot be advertised on the internet from AWS. Values: public, private"
  value       = element(concat(aws_vpc_ipv6_cidr_block_association.vpc_ipv6_cidr_block_association.*.ipv6_address_attribute, [""]), 0)
}
