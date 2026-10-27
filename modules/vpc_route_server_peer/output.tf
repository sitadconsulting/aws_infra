output "vpc_route_server_peer_arn" {
  description = "ARN of the route server peer"
  value       = element(concat(aws_vpc_route_server_peer.vpc_route_server_peer.*.arn, [""]), 0)
}
output "vpc_route_server_peer_endpoint_eni_address" {
  description = "IP address of the Elastic network interface for the route server endpoint"
  value       = element(concat(aws_vpc_route_server_peer.vpc_route_server_peer.*.endpoint_eni_address, [""]), 0)
}
output "vpc_route_server_peer_endpoint_eni_id" {
  description = "ID of the Elastic network interface for the route server endpoint"
  value       = element(concat(aws_vpc_route_server_peer.vpc_route_server_peer.*.endpoint_eni_id, [""]), 0)
}
output "vpc_route_server_peer_route_server_id" {
  description = "ID of the route server associated with this peer"
  value       = element(concat(aws_vpc_route_server_peer.vpc_route_server_peer.*.route_server_id, [""]), 0)
}
output "vpc_route_server_peer_route_server_peer_id" {
  description = "Unique identifier of the route server peer"
  value       = element(concat(aws_vpc_route_server_peer.vpc_route_server_peer.*.route_server_peer_id, [""]), 0)
}
output "vpc_route_server_peer_subnet_id" {
  description = "ID of the subnet containing the route server peer"
  value       = element(concat(aws_vpc_route_server_peer.vpc_route_server_peer.*.subnet_id, [""]), 0)
}
output "vpc_route_server_peer_vpc_id" {
  description = "ID of the VPC containing the route server peer"
  value       = element(concat(aws_vpc_route_server_peer.vpc_route_server_peer.*.vpc_id, [""]), 0)
}
