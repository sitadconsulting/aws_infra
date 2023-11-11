variable "dx_hosted_transit_virtual_interface_address_family" {
  description = "The address family for the BGP peer. ipv4 or ipv6"
  type        = string
}
variable "dx_hosted_transit_virtual_interface_amazon_address" {
  description = "The IPv4 CIDR address to use to send traffic to Amazon. Required for IPv4 BGP peers"
  type        = string
  default     = null
}
variable "dx_hosted_transit_virtual_interface_bgp_asn" {
  description = "The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration"
  type        = number
}
variable "dx_hosted_transit_virtual_interface_bgp_auth_key" {
  description = "The authentication key for BGP configuration"
  type        = string
  default     = null
}
variable "dx_hosted_transit_virtual_interface_connection_id" {
  description = "The ID of the Direct Connect connection (or LAG) on which to create the virtual interface"
  type        = string
}
variable "dx_hosted_transit_virtual_interface_customer_address" {
  description = "The IPv4 CIDR destination address to which Amazon should send traffic. Required for IPv4 BGP peers"
  type        = string
  default     = null
}
variable "dx_hosted_transit_virtual_interface_mtu" {
  description = "The maximum transmission unit (MTU) is the size, in bytes, of the largest permissible packet that can be passed over the connection. The MTU of a virtual transit interface can be either 1500 or 8500 (jumbo frames). Default is 1500"
  type        = number
  default     = 1500
}
variable "dx_hosted_transit_virtual_interface_name" {
  description = "The name for the virtual interface"
  type        = string
}
variable "dx_hosted_transit_virtual_interface_owner_account_id" {
  description = "The AWS account that will own the new virtual interface"
  type        = string
}
variable "dx_hosted_transit_virtual_interface_vlan" {
  description = "The VLAN ID"
  type        = number
}
