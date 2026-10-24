variable "nat_gateway_allocation_id" {
  description = "(Optional, zonal NAT gateways only) The Allocation ID of the Elastic IP address for the NAT Gateway. Required when connectivity_type is set to public and availability_mode is set to zonal. When availability_mode is set to regional, this must not be set; instead, use the availability_zone_address block to specify EIPs for each AZ"
  type        = string
  default     = null
}
variable "nat_gateway_availability_mode" {
  description = "(Optional) Specifies whether to create a zonal (single-AZ) or regional (multi-AZ) NAT gateway. Valid values are zonal and regional. Defaults to zonal"
  type        = string
  default     = null
}
variable "nat_gateway_connectivity_type" {
  description = "(Optional) Connectivity type for the NAT Gateway. Valid values are private and public. When availability_mode is set to regional, this must be set to public. Defaults to public"
  type        = string
  default     = "public"
}
variable "nat_gateway_private_ip" {
  description = "(Optional, zonal NAT gateways only) The private IPv4 address to assign to the NAT Gateway. If you don't provide an address, a private IPv4 address will be automatically assigned"
  type        = string
  default     = null
}
variable "nat_gateway_subnet_id" {
  description = "(Optional, zonal NAT gateways only) The Subnet ID of the subnet in which to place the NAT Gateway. Required when availability_mode is set to zonal. Must not be set when availability_mode is set to regional"
  type        = string
  default     = null
}
variable "nat_gateway_secondary_allocation_ids" {
  description = "(Optional, zonal NAT gateways only) A list of secondary allocation EIP IDs for this NAT Gateway. To remove all secondary allocations an empty list should be specified "
  type        = list(string)
  default     = null
}
variable "nat_gateway_secondary_private_ip_address_count" {
  description = "(Optional, zonal and private NAT gateways only) The number of secondary private IPv4 addresses you want to assign to the NAT Gateway"
  type        = number
  default     = null
}
variable "nat_gateway_secondary_private_ip_addresses" {
  description = "(Optional, zonal NAT gateways only) A list of secondary private IPv4 addresses to assign to the NAT Gateway. To remove all secondary private addresses an empty list should be specified"
  type        = list(string)
  default     = null
}
variable "nat_gateway_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "nat_gateway_vpc_id" {
  desscription = "(Optional, regional NAT gateways only) VPC ID where this NAT Gateway will be created. Required when availability_mode is set to regional"
  type         = string
  default      = null
}
variable "nat_gateway_availability_zone_address" {
  description = "(Optional, regional NAT gateways only) Repeatable configuration block for the Elastic IP addresses (EIPs) and availability zones for the regional NAT gateway. When not specified, the regional NAT gateway will automatically expand to new AZs and associate EIPs upon detection of an elastic network interface (auto mode). When specified, auto-expansion is disabled (manual mode)"
  type        = list(object({
    allocation_ids       = list(string)
    availability_zone    = optional(string)
    availability_zone_id = optional(string)
  }))
  default     = []
}
