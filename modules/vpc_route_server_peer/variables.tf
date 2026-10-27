variable "vpc_route_server_peer_peer_address" {
  description = "(Required) IPv4 address of the peer device"
  type        = string
}
variable "vpc_route_server_peer_route_server_endpoint_id" {
  description = "(Required) ID of the route server endpoint for which to create a peer"
  type        = string
}
variable "vpc_route_server_peer_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "vpc_route_server_peer_bgp_options" {
  description = "(Required) BGP options for the peer, including ASN (Autonomous System Number) and BFD (Bidrectional Forwarding Detection) settings"
  type        = list(object({
    peer_asn                = number
    peer_liveness_detection = optional(string)
  }))
  default     = []
}
