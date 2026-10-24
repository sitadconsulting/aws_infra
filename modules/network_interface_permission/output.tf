output "network_interface_permission_network_interface_permission_id" {
  description = "ENI permission ID"
  value       = element(concat(aws_network_interface_permission.network_interface_permission.*.network_interface_permission_id, [""]), 0)
}
