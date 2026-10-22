output "ec2_secondary_subnet_arn" {
  description = "ARN of the secondary subnet"
  value       = element(concat(aws_ec2_secondary_subnet.ec2_secondary_subnet.*.arn, [""]), 0)
}
output "ec2_secondary_subnet_id" {
  description = "ID of the secondary subnet"
  value       = element(concat(aws_ec2_secondary_subnet.ec2_secondary_subnet.*.id, [""]), 0)
}
output "ec2_secondary_subnet_ipv4_cidr_block_associations" {
  description = "A list of IPv4 CIDR block associations for the secondary network"
  value       = element(concat(aws_ec2_secondary_subnet.ec2_secondary_subnet.*.ipv4_cidr_block_associations, [""]), 0)
}
output "ec2_secondary_subnet_owner_id" {
  description = "ID of the AWS account that owns the secondary subnet"
  value       = element(concat(aws_ec2_secondary_subnet.ec2_secondary_subnet.*.owner_id, [""]), 0)
}
output "ec2_secondary_subnet_secondary_network_type" {
  description = "Type of the secondary network (e.g., rdma)"
  value       = element(concat(aws_ec2_secondary_subnet.ec2_secondary_subnet.*.secondary_network_type, [""]), 0)
}
output "ec2_secondary_subnet_secondary_subnet_id" {
  description = "ID of the secondary subnet"
  value       = element(concat(aws_ec2_secondary_subnet.ec2_secondary_subnet.*.secondary_subnet_id, [""]), 0)
}
output "ec2_secondary_subnet_state" {
  description = "State of the secondary subnet"
  value       = element(concat(aws_ec2_secondary_subnet.ec2_secondary_subnet.*.state, [""]), 0)
}
