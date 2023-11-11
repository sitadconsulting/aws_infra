output "dx_connection_arn" {
  description = "Connection ARN"
  value       = element(concat(aws_dx_connection.dx_connection.*.arn, [""]), 0)
}
output "dx_connection_aws_device" {
  description = "The Direct Connect endpoint on which the physical connection terminates"
  value       = element(concat(aws_dx_connection.dx_connection.*.aws_device, [""]), 0)
}
output "dx_connection_has_logical_redundancy" {
  description = "Indicates whether the connection supports a secondary BGP peer in the same address family (IPv4/IPv6)"
  value       = element(concat(aws_dx_connection.dx_connection.*.has_logical_redundancy, [""]), 0)
}
output "dx_connection_id" {
  description = "Connection ID"
  value       = element(concat(aws_dx_connection.dx_connection.*.id, [""]), 0)
}
output "dx_connection_jumbo_frame_capable" {
  description = "Boolean value representing if jumbo frames have been enabled for this connection"
  value       = element(concat(aws_dx_connection.dx_connection.*.jumbo_frame_capable, [""]), 0)
}
output "dx_connection_macsec_capable" {
  description = "Boolean value indicating whether the connection supports MAC Security (MACsec)"
  value       = element(concat(aws_dx_connection.dx_connection.*.macsec_capable, [""]), 0)
}
output "dx_connection_owner_account_id" {
  description = "The ID of the AWS account that owns the connection"
  value       = element(concat(aws_dx_connection.dx_connection.*.owner_account_id, [""]), 0)
}
output "dx_connection_partner_name" {
  description = "The name of the AWS Direct Connect service provider associated with the connection"
  value       = element(concat(aws_dx_connection.dx_connection.*.partner_name, [""]), 0)
}
output "dx_connection_port_encryption_status" {
  description = "The MAC Security (MACsec) port link status of the connection"
  value       = element(concat(aws_dx_connection.dx_connection.*.port_encryption_status, [""]), 0)
}
output "dx_connection_vlan_id" {
  description = "The VLAN ID"
  value       = element(concat(aws_dx_connection.dx_connection.*.vlan_id, [""]), 0)
}
