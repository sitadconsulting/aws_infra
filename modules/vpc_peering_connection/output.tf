output "vpc_peering_connection_accept_status" {
  description = "Status of the VPC Peering Connection request"
  value       = element(concat(aws_vpc_peering_connection.vpc_peering_connection.*.accept_status, [""]), 0)
}
output "vpc_peering_connection_accept_id" {
  description = "ID of the VPC Peering Connection"
  value       = element(concat(aws_vpc_peering_connection.vpc_peering_connection.*.id, [""]), 0)
}
