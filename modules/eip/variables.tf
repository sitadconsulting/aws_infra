variable "eip_address" {
  description = "IP address from an EC2 BYOIP pool. This option is only available for VPC EIPs"
  type        = string
  default     = ""
}
variable "eip_associate_with_private_ip" {
  description = "User-specified primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address"
  type        = string
  default     = ""
}
variable "eip_customer_owned_ipv4_pool" {
  description = "ID of a customer-owned address pool"
  type        = string
  default     = ""
}
variable "eip_domain" {
  description = "Indicates if this EIP is for use in VPC (vpc)"
  type        = string
  default     = null
}
variable "eip_instance" {
  description = "EC2 instance ID"
  type        = string
  default     = ""
}
variable "eip_network_border_group" {
  description = "Location from which the IP address is advertised. Use this parameter to limit the address to this location"
  type        = string
  default     = ""
}
variable "eip_network_interface" {
  description = "Network interface ID to associate with"
  type        = string
  default     = ""
}
variable "eip_public_ipv4_pool" {
  description = "EC2 IPv4 address pool identifier or amazon. This option is only available for VPC EIPs"
  type        = string
  default     = ""
}
variable "eip_tags" {
  description = "Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "eip_vpc" {
  description = "Boolean if the EIP is in a VPC or not. Use domain instead. Defaults to true unless the region supports EC2-Classic"
  type        = bool
  default     = false
}
