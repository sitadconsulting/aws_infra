variable "vpc_assign_generated_ipv6_cidr_block" {
  description = "(Optional) Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block. Default is false. Conflicts with ipv6_ipam_pool_id"
  type        = bool
  default     = false
}
variable "vpc_cidr_block" {
  description = "(Optional) IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length"
  type        = string
  default     = null
}
variable "vpc_enable_dns_hostnames" {
  description = "(Optional) Whether to enable DNS hostnames in the VPC. Defaults to false"
  type        = bool
  default     = false
}
variable "vpc_enable_dns_support" {
  description = "(Optional) Whether to enable DNS support in the VPC. Defaults to true"
  type        = bool
  default     = false
}
variable "vpc_enable_network_address_usage_metrics" {
  description = "(Optional) Whether to enable Network Address Usage metrics for your VPC. Defaults to false"
  type        = bool
  default     = false
}
variable "vpc_instance_tenancy" {
  description = "(Optional) Tenancy option for instances launched into the VPC. Default is default, which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated, which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch. This has a dedicated per region fee of $2 per hour, plus an hourly per instance usage fee"
  type        = string
  default     = "default"
}
variable "vpc_ipv4_ipam_pool_id" {
  description = "(Optional) ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR. IPAM is a VPC feature that you can use to automate your IP address management workflows including assigning, tracking, troubleshooting, and auditing IP addresses across AWS Regions and accounts. Using IPAM you can monitor IP address usage throughout your AWS Organization"
  type        = string
  default     = null
}
variable "vpc_ipv4_netmask_length" {
  description = "(Optional) Netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id"
  type        = number
  default     = null
}
variable "vpc_ipv6_cidr_block" {
  description = "(Optional) IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using ipv6_netmask_length"
  type        = string
  default     = null
}
variable "vpc_ipv6_cidr_block_network_border_group" {
  description = "(Optional) By default when an IPv6 CIDR is assigned to a VPC a default ipv6_cidr_block_network_border_group will be set to the region of the VPC. This can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones"
  type        = string
  default     = null
}
variable "vpc_ipv6_ipam_pool_id" {
  description = "(Optional) IPAM Pool ID for a IPv6 pool. Conflicts with assign_generated_ipv6_cidr_block"
  type        = string
  default     = null
}
variable "vpc_ipv6_netmask_length" {
  description = "(Optional) Netmask length to request from IPAM Pool. Conflicts with ipv6_cidr_block. This can be omitted if IPAM pool as a allocation_default_netmask_length set. Valid values are from 44 to 60 in increments of 4"
  type        = number
  default     = null
}
variable "vpc_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
