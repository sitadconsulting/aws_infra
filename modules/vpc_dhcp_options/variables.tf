variable "vpc_dhcp_options_domain_name" {
  description = "(Optional) the suffix domain name to use by default when resolving non Fully Qualified Domain Names. In other words, this is what ends up being the search value in the /etc/resolv.conf file"
  type        = string
  default     = null
}
variable "vpc_dhcp_options_domain_name_servers" {
  description = "(Optional) List of name servers to configure in /etc/resolv.conf. If you want to use the default AWS nameservers you should set this to AmazonProvidedDNS"
  type        = list(string)
  default     = null
}
variable "vpc_dhcp_options_ipv6_address_preferred_lease_time" {
  description = "(Optional) How frequently, in seconds, a running instance with an IPv6 assigned to it goes through DHCPv6 lease renewal. Acceptable values are between 140 and 2147483647 (approximately 68 years). If no value is entered, the default lease time is 140 seconds. If you use long-term addressing for EC2 instances, you can increase the lease time and avoid frequent lease renewal requests. Lease renewal typically occurs when half of the lease time has elapsed"
  type        = string
  default     = null
}
variable "vpc_dhcp_options_netbios_name_servers" {
  description = "(Optional) List of NETBIOS name servers"
  type        = list(string)
  default     = null
}
variable "vpc_dhcp_options_netbios_node_type" {
  description = "(Optional) NetBIOS node type (1, 2, 4, or 8). AWS recommends to specify 2 since broadcast and multicast are not supported in their network. For more information about these node types"
  type        = string
  default     = null
}
variable "vpc_dhcp_options_ntp_servers" {
  description = "(Optional) List of NTP servers to configure"
  type        = list(string)
  default     = null
}
variable "vpc_dhcp_options_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
