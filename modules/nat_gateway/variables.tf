variable "nat_gateway_allocation_id" {
  description = "The Allocation ID of the Elastic IP address for the gateway. Required for connectivity_type of public"
  type        = string
  default     = ""
}
variable "nat_gateway_connectivity_type" {
  description = "Connectivity type for the gateway. Valid values are private and public. Defaults to public"
  type        = string
  default     = "public"
}
variable "nat_gateway_private_ip" {
  description = "The private IPv4 address to assign to the NAT gateway. If you don't provide an address, a private IPv4 address will be automatically assigned"
  type        = string
  default     = null
}
variable "nat_gateway_subnet_id" {
  description = "The Subnet ID of the subnet in which to place the gateway"
  type        = string
}
variable "nat_gateway_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
