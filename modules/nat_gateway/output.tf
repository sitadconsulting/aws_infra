output "nat_gateway_association_id" {
  description = "The association ID of the Elastic IP address that's associated with the NAT gateway. Only available when connectivity_type is public"
  value       = element(concat(aws_nat_gateway.nat_gateway.*.association_id, [""]), 0)
}
output "nat_gateway_auto_provision_zones" {
  description = "(regional NAT gateways only) Indicates whether AWS automatically manages AZ coverage"
  value       = element(concat(aws_nat_gateway.nat_gateway.*.auto_provision_zones, [""]), 0)
}
output "nat_gateway_auto_scaling_ips" {
  description = "(regional NAT gateways only) Indicates whether AWS automatically allocates additional Elastic IP addresses (EIPs) in an AZ when the NAT gateway needs more ports due to increased concurrent connections to a single destination from that AZ"
  value       = element(concat(aws_nat_gateway.nat_gateway.*.auto_scaling_ips, [""]), 0)
}
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = element(concat(aws_nat_gateway.nat_gateway.*.id, [""]), 0)
}
output "nat_gateway_network_interface_id" {
  description = "The ID of the network interface associated with the NAT gateway"
  value       = element(concat(aws_nat_gateway.nat_gateway.*.network_interface_id, [""]), 0)
}
output "nat_gateway_public_ip" {
  description = "The Elastic IP address associated with the NAT gateway"
  value       = element(concat(aws_nat_gateway.nat_gateway.*.public_ip, [""]), 0)
}
output "nat_gateway_regional_nat_gateway_address" {
  description = "(regional NAT gateways only) Repeatable blocks for information about the IP addresses and network interface associated with the regional NAT gateway"
  value       = element(concat(aws_nat_gateway.nat_gateway.*.regional_nat_gateway_address, [""]), 0)
}
output "nat_gateway_route_table_id" {
  description = "(regional NAT gateways only) ID of the automatically created route table"
  value       = element(concat(aws_nat_gateway.nat_gateway.*.route_table_id, [""]), 0)
}
