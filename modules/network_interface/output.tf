output "network_interface_id" {
  description = "ID of the network interface"
  value       = element(concat(aws_network_interface.network_interface.*.id, [""]), 0)
}
output "network_interface_arn" {
  description = "ARN of the network interface"
  value       = element(concat(aws_network_interface.network_interface.*.arn, [""]), 0)
}
output "network_interface_mac_address" {
  description = "MAC address of the network interface"
  value       = element(concat(aws_network_interface.network_interface.*.mac_address, [""]), 0)
}
output "network_interface_private_dns_name" {
  description = "Private DNS name of the network interface"
  value       = element(concat(aws_network_interface.network_interface.*.private_dns_name, [""]), 0)
}
