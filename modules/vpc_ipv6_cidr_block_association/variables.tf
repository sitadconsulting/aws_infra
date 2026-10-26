variable "vpc_ipv6_cidr_block_association_assign_generated_ipv6_cidr_block" {
  description = "(Optional) Whether to request an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IPv6 addresses, or the size of the CIDR block. Default is false. Conflicts with ipv6_ipam_pool_id, ipv6_pool, ipv6_cidr_block and ipv6_netmask_length"
  type        = string
  default     = null
}
variable "vpc_ipv6_cidr_block_association_ipv6_cidr_block" {
  description = "(Optional) IPv6 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv6_netmask_length. This parameter is required if ipv6_netmask_length is not set and the IPAM pool does not have allocation_default_netmask set. Conflicts with assign_generated_ipv6_cidr_block"
  type        = string
  default     = null
}
variable "vpc_ipv6_cidr_block_association_ipv6_ipam_pool_id" {
  description = "(Optional) ID of an IPv6 IPAM pool you want to use for allocating this VPC's CIDR. IPAM is a VPC feature that you can use to automate your IP address management workflows including assigning, tracking, troubleshooting, and auditing IP addresses across AWS Regions and accounts. Conflict with assign_generated_ipv6_cidr_block and ipv6_pool"
  type        = string
  default     = null
}
variable "vpc_ipv6_cidr_block_association_ipv6_netmask_length" {
  description = "(Optional) Netmask length of the IPv6 CIDR you want to allocate to this VPC. Requires specifying a ipv6_ipam_pool_id. This parameter is optional if the IPAM pool has allocation_default_netmask set, otherwise it or ipv6_cidr_block are required. Conflicts with ipv6_cidr_block"
  type        = string
  default     = null
}
variable "vpc_ipv6_cidr_block_association_ipv6_pool" {
  description = "(Optional) ID of an IPv6 address pool from which to allocate the IPv6 CIDR block. Conflicts with assign_generated_ipv6_cidr_block and ipv6_ipam_pool_id"
  type        = string
  default     = null
}
variable "vpc_ipv6_cidr_block_association_vpc_id" {
  description = "(Required) ID of the VPC to make the association with"
  type        = string
}
