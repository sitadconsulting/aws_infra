output "ec2_transit_gateway_connect_peer_id" {
  description = "EC2 Transit Gateway Connect Peer identifier"
  value       = element(concat(aws_ec2_transit_gateway_connect_peer.ec2_transit_gateway_connect_peer.*.id, [""]), 0)
}
output "ec2_transit_gateway_connect_peer_arn" {
  description = "EC2 Transit Gateway Connect Peer ARN"
  value       = element(concat(aws_ec2_transit_gateway_connect_peer.ec2_transit_gateway_connect_peer.*.arn, [""]), 0)
}
output "ec2_transit_gateway_connect_peer_bgp_peer_address" {
  description = "The IP address assigned to customer device, which is used as BGP IP address"
  value       = element(concat(aws_ec2_transit_gateway_connect_peer.ec2_transit_gateway_connect_peer.*.bgp_peer_address, [""]), 0)
}
output "ec2_transit_gateway_connect_peer_bgp_transit_gateway_addresses" {
  description = "The IP addresses assigned to Transit Gateway, which are used as BGP IP addresses"
  value       = element(concat(aws_ec2_transit_gateway_connect_peer.ec2_transit_gateway_connect_peer.*.bgp_transit_gateway_addresses, [""]), 0)
}
