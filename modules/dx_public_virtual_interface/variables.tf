variable "dx_public_virtual_interface_address_family" {
  description = "The address family for the BGP peer. ipv4 or ipv6"
  type        = string
}
variable "dx_public_virtual_interface_amazon_address" {
  description = "The IPv4 CIDR address to use to send traffic to Amazon. Required for IPv4 BGP peers"
  type        = string
  default     = null
}
variable "dx_public_virtual_interface_bgp_asn" {
  description = "The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration"
  type        = number
}
variable "dx_public_virtual_interface_bgp_auth_key" {
  description = "The authentication key for BGP configuration"
  type        = string
  default     = null
}
variable "dx_public_virtual_interface_connection_id" {
  description = "The ID of the Direct Connect connection (or LAG) on which to create the virtual interface"
  type        = string
}
variable "dx_public_virtual_interface_customer_address" {
  description = "The IPv4 CIDR destination address to which Amazon should send traffic. Required for IPv4 BGP peers"
  type        = string
  default     = null
}
variable "dx_public_virtual_interface_name" {
  description = "The name for the virtual interface"
  type        = string
}
variable "dx_public_virtual_interface_route_filter_prefixes" {
  description = "A list of routes to be advertised to the AWS network in this region"
  type        = list(string)
}
variable "dx_public_virtual_interface_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "dx_public_virtual_interface_vlan" {
  description = "The VLAN ID"
  type        = number
}
