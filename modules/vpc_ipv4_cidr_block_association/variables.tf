variable "vpc_ipv4_cidr_block_association_cidr_block" {
  description = "(Optional) IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length"
  type        = string
  default     = null
}
variable "vpc_ipv4_cidr_block_association_ipv4_ipam_pool_id" {
  description = "(Optional) ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR. IPAM is a VPC feature that you can use to automate your IP address management workflows including assigning, tracking, troubleshooting, and auditing IP addresses across AWS Regions and accounts. Using IPAM you can monitor IP address usage throughout your AWS Organization"
  type        = string
  default     = null
}
variable "vpc_ipv4_cidr_block_association_ipv4_netmask_length" {
  description = "(Optional) Netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id"
  type        = string
  default     = null
}
variable "vpc_ipv4_cidr_block_association_vpc_id" {
  description = "(Required) ID of the VPC to make the association with"
  type        = string
}
