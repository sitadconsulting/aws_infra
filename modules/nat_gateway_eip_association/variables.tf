variable "nat_gateway_eip_association_allocation_id" {
  description = "(Required) The ID of the Elastic IP Allocation to associate with the NAT Gateway"
  type        = string
}
variable "nat_gateway_eip_association_nat_gateway_id" {
  description = "(Required) The ID of the NAT Gateway to associate the Elastic IP Allocation to"
  type        = string
}
