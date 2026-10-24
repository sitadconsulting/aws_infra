variable "network_interface_description" {
  description = "(Optional) Description for the network interface"
  type        = string
  default     = null
}
variable "network_interface_enable_primary_ipv6" {
  description = "(Optional) Enables assigning a primary IPv6 Global Unicast Address (GUA) to the network interface (ENI) in dual-stack or IPv6-only subnets. This ensures the instance attached to the ENI retains a consistent IPv6 address. Once enabled, the first IPv6 GUA becomes the primary IPv6 address and cannot be disabled. The primary IPv6 address remains assigned until the instance is terminated or the ENI is detached. Enabling and subsequent disabling forces recreation of the ENI"
  type        = bool
  default     = null
}
variable "network_interface_interface_type" {
  description = "(Optional) Type of network interface to create. Set to efa for Elastic Fabric Adapter. Changing interface_type will cause the resource to be destroyed and re-created"
  type        = string
  default     = null
}
variable "network_interface_ipv4_prefix_count" {
  description = "(Optional) Number of IPv4 prefixes that AWS automatically assigns to the network interface"
  type        = number
  default     = null
}
variable "network_interface_ipv4_prefixes" {
  description = "(Optional) One or more IPv4 prefixes assigned to the network interface"
  type        = list(string)
  default     = null
}
variable "network_interface_ipv6_address_count" {
  description = "(Optional) Number of IPv6 addresses to assign to a network interface. You can't use this option if specifying specific ipv6_addresses. If your subnet has the AssignIpv6AddressOnCreation attribute set to true, you can specify 0 to override this setting" 
  type        = number
  default     = null
}
variable "network_interface_ipv6_address_list_enabled" {
  description = "(Optional) Whether ipv6_address_list is allowed and controls the IPs to assign to the ENI and ipv6_addresses and ipv6_address_count become read-only. Default is false" 
  type        = bool
  default     = null
}
variable "network_interface_ipv6_address_list" {
  description = "(Optional) List of private IPs to assign to the ENI in sequential order"
  type        = list(string)
  default     = null
}
variable "network_interface_ipv6_addresses" {
  description = "(Optional) One or more specific IPv6 addresses from the IPv6 CIDR block range of your subnet. Addresses are assigned without regard to order. You can't use this option if you're specifying ipv6_address_count"
  type        = list(string)
  default     = null
}
variable "network_interface_ipv6_prefix_count" {
  description = "(Optional) Number of IPv6 prefixes that AWS automatically assigns to the network interface"
  type        = number
  default     = null
}
variable "network_interface_ipv6_prefixes" {
  description = "(Optional) One or more IPv6 prefixes assigned to the network interface"
  type        = list(string)
  default     = null
}
variable "network_interface_private_ip_list" {
  description = "(Optional) List of private IPs to assign to the ENI in sequential order. Requires setting private_ip_list_enabled to true"
  type        = list(string)
  default     = null
}
variable "network_interface_private_ip_list_enabled" {
  description = "Optional) Whether private_ip_list is allowed and controls the IPs to assign to the ENI and private_ips and private_ips_count become read-only. Default is false"
  type        = bool
  default     = null
}
variable "network_interface_private_ips" {
  description = "(Optional) List of private IPs to assign to the ENI without regard to order"
  type        = list(string)
  default     = null
}
variable "network_interface_private_ips_count" {
  description = "(Optional) Number of secondary private IPs to assign to the ENI. The total number of private IPs will be 1 + private_ips_count, as a primary private IP will be assigned to an ENI by default"
  type        = number
  default     = null
}
variable "network_interface_security_groups" {
  description = "(Optional) List of security group IDs to assign to the ENI"
  type        = list(string)
  default     = null
}
variable "network_interface_source_dest_check" {
  description = "(Optional) Whether to enable source destination checking for the ENI. Default true"
  type        = bool
  default     = null
}
variable "network_interface_subnet_id" {
  description = "(Required) Subnet ID to create the ENI in"
  type        = string
}
variable "network_interface_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "network_interface_attachment" {
  description = "(Optional) Configuration block to define the attachment of the ENI"
  type        = list(object({
    instance           = string
    device_index       = number
    network_card_index = optional(number)
  }))
  default     = []
}
variable "network_interface_connection_tracking_specification" {
  description = "(Optional) Configures the connection tracking timeouts for the network interface"
  type        = list(object({
    tcp_established_timeout = optional(number)
    udp_stream_timeout      = optional(number)
    udp_timeout             = optional(number)
  }))
  default     = []
}
variable "network_interface_ena_srd_specification" {
  description = "(Optional) Configures ENA Express for the network interface. The ENI must be attached to an instance to configure ENA Express"
  type        = list(object({
    ena_srd_enabled           = optional(bool)
    ena_srd_udp_specification = optional(list(object({
      ena_srd_udp_enabled = optional(bool)
    })), [])
  }))
  default     = []
}
