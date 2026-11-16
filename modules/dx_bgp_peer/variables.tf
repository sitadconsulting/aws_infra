variable "dx_bgp_peer_address_family" {
  description = "(Required) The address family for the BGP peer. ipv4 or ipv6"
  type        = string
}
variable "dx_bgp_peer_bgp_asn" {
  description = "(Optional) BGP autonomous system number as an integer between 1 and 2147483646. For larger values, use bgp_asn_long. Exactly one of bgp_asn or bgp_asn_long must be specified"
  type        = number
  default     = null
}
variable "dx_bgp_peer_bgp_asn_long" {
  description = "(Optional) BGP autonomous system number as an asplain decimal string between 1 and 4294967294. This argument also accepts values in the bgp_asn range. Exactly one of bgp_asn or bgp_asn_long must be specified"
  type        = number
  default     = null
}
variable "dx_bgp_peer_virtual_interface_id" {
  description = "(Required) The ID of the Direct Connect virtual interface on which to create the BGP peer"
  type        = string
}
variable "dx_bgp_peer_amazon_address" {
  description = "(Optional) The IPv4 CIDR address to use to send traffic to Amazon. Required for IPv4 BGP peers on public virtual interfaces"
  type        = string
  default     = null
}
variable "dx_bgp_peer_bgp_auth_key" {
  description = "(Optional) The authentication key for BGP configuration"
  type        = string
  default     = null
}
variable "dx_bgp_peer_customer_address" {
  description = "(Optional) The IPv4 CIDR destination address to which Amazon should send traffic. Required for IPv4 BGP peers on public virtual interfaces"
  type        = string
  default     = null
}
