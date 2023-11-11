output "dx_hosted_connection_id" {
  description = "Connection ID"
  value       = element(concat(aws_dx_hosted_connection.dx_hosted_connection.*.id, [""]), 0)
}
output "dx_hosted_connection_jumbo_frame_capable" {
  description = "Boolean value representing if jumbo frames have been enabled for this connection"
  value       = element(concat(aws_dx_hosted_connection.dx_hosted_connection.*.jumbo_frame_capable, [""]), 0)
}
output "dx_hosted_connection_has_logical_redundancy" {
  description = "Indicates whether the connection supports a secondary BGP peer in the same address family (IPv4/IPv6)"
  value       = element(concat(aws_dx_hosted_connection.dx_hosted_connection.*.has_logical_redundancy, [""]), 0)
}
output "dx_hosted_connection_aws_device" {
  description = "The Direct Connect endpoint on which the physical connection terminates"
  value       = element(concat(aws_dx_hosted_connection.dx_hosted_connection.*.aws_device, [""]), 0)
}
output "dx_hosted_connection_state" {
  description = "The state of the connection. Possible values include: ordering, requested, pending, available, down, deleting, deleted, rejected, unknown. See AllocateHostedConnection for a description of each connection state"
  value       = element(concat(aws_dx_hosted_connection.dx_hosted_connection.*.state, [""]), 0)
}
output "dx_hosted_connection_lag_id" {
  description = "LAG ID"
  value       = element(concat(aws_dx_hosted_connection.dx_hosted_connection.*.lag_id, [""]), 0)
}
output "dx_hosted_connection_loa_issue_time" {
  description = "he time of the most recent call to DescribeLoa for this connection"
  value       = element(concat(aws_dx_hosted_connection.dx_hosted_connection.*.loa_issue_time, [""]), 0)
}
output "dx_hosted_connection_location" {
  description = "Connection location"
  value       = element(concat(aws_dx_hosted_connection.dx_hosted_connection.*.location, [""]), 0)
}
output "dx_hosted_connection_partner_name" {
  description = "The name of the AWS Direct Connect service provider associated with the connection"
  value       = element(concat(aws_dx_hosted_connection.dx_hosted_connection.*.partner_name, [""]), 0)
}
output "dx_hosted_connection_provider_name" {
  description = "The name of the service provider associated with the connection"
  value       = element(concat(aws_dx_hosted_connection.dx_hosted_connection.*.provider_name, [""]), 0)
}
output "dx_hosted_connection_region" {
  description = "The AWS Region where the connection is located"
  value       = element(concat(aws_dx_hosted_connection.dx_hosted_connection.*.region, [""]), 0)
}

