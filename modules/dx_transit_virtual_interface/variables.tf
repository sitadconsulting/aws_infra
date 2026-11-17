variable "dx_transit_virtual_interface_address_family" {
  description = "(Required) The address family for the BGP peer. ipv4 or ipv6"
  type        = string
}
variable "dx_transit_virtual_interface_amazon_address" {
  description = "(Optional) The IPv4 CIDR address to use to send traffic to Amazon. Required for IPv4 BGP peers"
  type        = string
  default     = null
}
variable "dx_transit_virtual_interface_bgp_asn" {
  description = "(Optional) BGP autonomous system number as an integer between 1 and 2147483646. For larger values, use bgp_asn_long. Exactly one of bgp_asn or bgp_asn_long must be specified"
  type        = number
  default     = null
}
variable "dx_transit_virtual_interface_bgp_asn_long" {
  description = "(Optional) BGP autonomous system number as an asplain decimal string between 1 and 4294967294. This argument also accepts values in the bgp_asn range. Exactly one of bgp_asn or bgp_asn_long must be specified"
  type        = number
  default     = null
}
variable "dx_transit_virtual_interface_bgp_auth_key" {
  description = "(Optional) The authentication key for BGP configuration"
  type        = string
  default     = null
}
variable "dx_transit_virtual_interface_connection_id" {
  description = "(Required) The ID of the Direct Connect connection (or LAG) on which to create the virtual interface"
  type        = string
}
variable "dx_transit_virtual_interface_customer_address" {
  description = "(Optional) The IPv4 CIDR destination address to which Amazon should send traffic. Required for IPv4 BGP peers"
  type        = string
  default     = null
}
variable "dx_transit_virtual_interface_dx_gateway_id" {
  description = "(Required) The ID of the Direct Connect gateway to which to connect the virtual interface"
  type        = string
}
variable "dx_transit_virtual_interface_mtu" {
  description = "(Optional) The maximum transmission unit (MTU) is the size, in bytes, of the largest permissible packet that can be passed over the connection. The MTU of a virtual transit interface can be either 1500 or 8500 (jumbo frames). Default is 1500"
  type        = number
  default     = 1500
}
variable "dx_transit_virtual_interface_name" {
  description = "(Required) The name for the virtual interface"
  type        = string
}
variable "dx_transit_virtual_interface_prefix_pool_allocated_count_ipv4" {
  description = "(Optional) The number of inbound IPv4 route prefixes to allocate to the virtual interface. Valid values are 0 to 1000. If not specified, AWS applies the default allocation of 100 "
  type        = number
  default     = null
}
variable "dx_transit_virtual_interface_prefix_pool_allocated_count_ipv6" {
  description = "(Optional) The number of inbound IPv6 route prefixes to allocate to the virtual interface. Valid values are 0 to 1000. If not specified, AWS applies the default allocation of 100"
  type        = number
  default     = null
}
variable "dx_transit_virtual_interface_rate_limit" {
  description = "(Optional) Maximum bandwidth allocation for the virtual interface, restricting the bandwidth it can use on the parent connection. Specify a supported bandwidth value without a space (for example, 50Mbps, 1Gbps, or 10Gbps); the value cannot exceed the bandwidth of the parent connection or link aggregation group (LAG), and supported values range up to 1.6Tbps. See the VIF Rate Limiters documentation for the full list of supported values. Rate Limiters are supported only on Direct Connect dedicated connections (including LAGs); they are not supported on hosted connections"
  type        = string
  default     = null
}
variable "dx_transit_virtual_interface_sitelink_enabled" {
  description = "(Optional) Indicates whether to enable or disable SiteLink"
  type        = bool
  default     = false
}
variable "dx_transit_virtual_interface_tags" {
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "dx_transit_virtual_interface_vlan" {
  description = "(Required) The VLAN ID"
  type        = number
}
