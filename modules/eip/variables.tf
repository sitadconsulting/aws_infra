variable "eip_address" {
  description = "(Optional) IP address from an EC2 BYOIP pool. This option is only available for VPC EIPs"
  type        = string
  default     = null
}
variable "eip_associate_with_private_ip" {
  description = "(Optional) User-specified primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address"
  type        = string
  default     = null
}
variable "eip_customer_owned_ipv4_pool" {
  description = "(Optional) ID of a customer-owned address pool"
  type        = string
  default     = null
}
variable "eip_domain" {
  description = "(Optional) Indicates if this EIP is for use in VPC (vpc)"
  type        = string
  default     = null
}
variable "eip_instance" {
  description = "(Optional) EC2 instance ID"
  type        = string
  default     = null
}
variable "eip_ipam_pool_id" {
  description = "(Optional) The ID of an IPAM pool which has an Amazon-provided or BYOIP public IPv4 CIDR provisioned to it"
  type        = string
  default     = null
}
variable "eip_network_border_group" {
  description = "(Optional) Location from which the IP address is advertised. Use this parameter to limit the address to this location"
  type        = string
  default     = null
}
variable "eip_network_interface" {
  description = "(Optional) Network interface ID to associate with"
  type        = string
  default     = null
}
variable "eip_public_ipv4_pool" {
  description = "(Optional) EC2 IPv4 address pool identifier or amazon. This option is only available for VPC EIPs"
  type        = string
  default     = null
}
variable "eip_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
