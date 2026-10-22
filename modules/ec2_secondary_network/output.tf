output "ec2_secondary_network_arn" {
  description = "ARN of the secondary network"
  value       = element(concat(aws_ec2_secondary_network.ec2_secondary_network.*.arn, [""]), 0)
}
output "ec2_secondary_network_id" {
  description = "ID of the secondary network"
  value       = element(concat(aws_ec2_secondary_network.ec2_secondary_network.*.id, [""]), 0)
}
output "ec2_secondary_network_ipv4_cidr_block_associations" {
  description = "A list of IPv4 CIDR block associations for the secondary network"
  value       = element(concat(aws_ec2_secondary_network.ec2_secondary_network.*.ipv4_cidr_block_associations, [""]), 0)
}
output "ec2_secondary_network_secondary_network_id" {
  description = "ID of the secondary network"
  value       = element(concat(aws_ec2_secondary_network.ec2_secondary_network.*.secondary_network_id, [""]), 0)
}
output "ec2_secondary_network_state" {
  description = "Current state of the secondary network"
  value       = element(concat(aws_ec2_secondary_network.ec2_secondary_network.*.state, [""]), 0)
}
