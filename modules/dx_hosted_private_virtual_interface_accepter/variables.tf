variable "dx_hosted_private_virtual_interface_accepter_dx_gateway_id" {
  description = "(Optional) The ID of the Direct Connect gateway to which to connect the virtual interface"
  type        = string
  default     = null
}
variable "dx_hosted_private_virtual_interface_accepter_prefix_pool_allocated_count_ipv4" {
  description = "(Optional) The number of inbound IPv4 route prefixes to allocate to the virtual interface. Valid values are 0 to 1000. If not specified, AWS applies the default allocation of 100"
  type        = number
  default     = null
}
variable "dx_hosted_private_virtual_interface_accepter_prefix_pool_allocated_count_ipv6" {
  description = "(Optional) The number of inbound IPv6 route prefixes to allocate to the virtual interface. Valid values are 0 to 1000. If not specified, AWS applies the default allocation of 100"
  type        = number 
  default     = null
}
variable "dx_hosted_private_virtual_interface_accepter_virtual_interface_id" {
  description = "(Required) The ID of the Direct Connect virtual interface to accept"
  type        = string
}
variable "dx_hosted_private_virtual_interface_accepter_vpn_gateway_id" {
  description = "(Optional) The ID of the virtual private gateway to which to connect the virtual interface"
  type        = string
  default     = null
}
variable "dx_hosted_private_virtual_interface_accepter_tags" {
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
