variable "dx_bgp_peer_address_family" {
  description = "The address family for the BGP peer. ipv4 or ipv6"
  type        = string
  default     = "ipv4"
}
variable "dx_bgp_peer_bgp_asn" {
  description = "The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration"
  type        = number
}
variable "dx_bgp_peer_virtual_interface_id" {
  description = "The ID of the Direct Connect virtual interface on which to create the BGP peer"
  type        = string
}
variable "dx_bgp_peer_amazon_address" {
  description = "The IPv4 CIDR address to use to send traffic to Amazon. Required for IPv4 BGP peers on public virtual interfaces"
  type        = string
  default     = null
}
variable "dx_bgp_peer_bgp_auth_key" {
  description = "The authentication key for BGP configuration"
  type        = string
  default     = null
}
variable "dx_bgp_peer_customer_address" {
  description = "The IPv4 CIDR destination address to which Amazon should send traffic. Required for IPv4 BGP peers on public virtual interfaces"
  type        = string
  default     = null
}
