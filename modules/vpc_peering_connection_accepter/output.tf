output "vpc_peering_connection_accepter_accept_status" {
  description = "Status of the VPC Peering Connection request"
  value       = element(concat(aws_vpc_peering_connection_accepter.vpc_peering_connection_accepter.*.accept_status, [""]), 0)
}
output "vpc_peering_connection_accepter_id" {
  description = "ID of the VPC Peering Connection"
  value       = element(concat(aws_vpc_peering_connection_accepter.vpc_peering_connection_accepter.*.id, [""]), 0)
}
output "vpc_peering_connection_accepter_peer_owner_id" {
  description = "AWS account ID of the owner of the requester VPC"
  value       = element(concat(aws_vpc_peering_connection_accepter.vpc_peering_connection_accepter.*.peer_owner_id, [""]), 0)
}
output "vpc_peering_connection_accepter_peer_region" {
  description = "Region of the accepter VPC"
  value       = element(concat(aws_vpc_peering_connection_accepter.vpc_peering_connection_accepter.*.peer_region, [""]), 0)
}
output "vpc_peering_connection_accepter_peer_vpc_id" {
  description = "ID of the requester VPC"
  value       = element(concat(aws_vpc_peering_connection_accepter.vpc_peering_connection_accepter.*.peer_vpc_id, [""]), 0)
}
output "vpc_peering_connection_accepter_vpc_id" {
  description = "ID of the accepter VPC"
  value       = element(concat(aws_vpc_peering_connection_accepter.vpc_peering_connection_accepter.*.vpc_id, [""]), 0)
}
