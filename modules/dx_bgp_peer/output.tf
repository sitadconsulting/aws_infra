output "dx_bgp_peer_id" {
  description = "BGP peer resource ID"
  value       = element(concat(aws_dx_bgp_peer.dx_bgp_peer.*.id, [""]), 0)
}
output "dx_bgp_peer_bgp_status" {
  description = "State of the BGP peer"
  value       = element(concat(aws_dx_bgp_peer.dx_bgp_peer.*.bgp_status, [""]), 0)
}
output "dx_bgp_peer_bgp_peer_id" {
  description = "BGP peer ID"
  value       = element(concat(aws_dx_bgp_peer.dx_bgp_peer.*.bgp_peer_id, [""]), 0)
}
output "dx_bgp_peer_aws_device" {
  description = "The Direct Connect endpoint on which the BGP peer terminates"
  value       = element(concat(aws_dx_bgp_peer.dx_bgp_peer.*.aws_device, [""]), 0)
}
