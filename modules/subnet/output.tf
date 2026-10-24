output "public_subnet_id" {
  description = "List of IDs for public subnets"
  value       = element(concat(aws_subnet.subnet.*.id, [""]), 0)
}
output "private_subnet_id" {
  description = "List of IDs for private subnets"
  value       = element(concat(aws_subnet.subnet.*.id, [""]), 0)
}
output "public_subnet_arns" {
  description = "List of ARNs for public subnets"
  value       = element(concat(aws_subnet.subnet.*.arn, [""]), 0)
}
output "private_subnet_arns" {
  description = "List of ARNs for private subnets"
  value       = element(concat(aws_subnet.subnet.*.arn, [""]), 0)
}
output "subnet_ipv6_cidr_block_association_id" {
  description = "The association ID for the IPv6 CIDR block"
  value       = element(concat(aws_subnet.subnet.*.ipv6_cidr_block_association_id, [""]), 0)
}
output "subnet_owner_id" {
  description = "The ID of the AWS account that owns the subnet"
  value       = element(concat(aws_subnet.subnet.*.owner_id, [""]), 0)
}
