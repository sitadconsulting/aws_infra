output "nat_gateway_association_id" {
  description = "The association ID of the Elastic IP address that's associated with the NAT gateway. Only available when connectivity_type is public"
  value       = element(concat(aws_nat_gateway.nat_gateway.*.association_id, [""]), 0)
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
