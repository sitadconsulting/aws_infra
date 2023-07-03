variable "vpc_dhcp_options_domain_name" {
  description = "the suffix domain name to use by default when resolving non Fully Qualified Domain Names. In other words, this is what ends up being the search value in the /etc/resolv.conf file"
  type        = string
  default     = ""
}
variable "vpc_dhcp_options_domain_name_servers" {
  description = "List of name servers to configure in /etc/resolv.conf. If you want to use the default AWS nameservers you should set this to AmazonProvidedDNS"
  type        = list(string)
  default     = []
}
variable "vpc_dhcp_options_netbios_name_servers" {
  description = "List of NETBIOS name servers"
  type        = list(string)
  default     = []
}
variable "vpc_dhcp_options_netbios_node_type" {
  description = "The NetBIOS node type (1, 2, 4, or 8). AWS recommends to specify 2 since broadcast and multicast are not supported in their network"
  type        = string
  default     = ""
}
variable "vpc_dhcp_options_ntp_servers" {
  description = "List of NTP servers to configure"
  type        = list(string)
  default     = []
}
variable "vpc_dhcp_options_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
