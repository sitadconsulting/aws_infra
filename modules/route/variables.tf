variable "route_carrier_gateway_id" {
  description = "Identifier of a carrier gateway. This attribute can only be used when the VPC contains a subnet which is associated with a Wavelength Zone"
  type        = string
  default     = null
} 
variable "route_core_network_arn" {
  description = "The Amazon Resource Name (ARN) of a core network"
  type        = string
  default     = null
}
variable "route_destination_cidr_block" {
  description = "The destination CIDR block"
  type        = string
  default     = null
}
variable "route_destination_ipv6_cidr_block" {
  description = "The destination IPv6 CIDR block"
  type        = string
  default     = null
}
variable "route_destination_prefix_list_id" {
  description = "The ID of a managed prefix list destination"
  type        = string
  default     = null
}
variable "route_egress_only_gateway_id" {
  description = "Identifier of a VPC Egress Only Internet Gateway"
  type        = string
  default     = null
}
variable "route_gateway_id" {
  description = "Identifier of a VPC internet gateway or a virtual private gateway. Specify local when updating a previously imported local route"
  type        = string
  default     = null
}
variable "route_local_gateway_id" {
  description = "Identifier of a Outpost local gateway"
  type        = string
  default     = null
}
variable "route_nat_gateway_id" {
  description = "Identifier of a VPC NAT gateway"
  type        = string
  default     = null
}
variable "route_network_interface_id" {
  description = "Identifier of an EC2 network interface"
  type        = string
  default     = null
}
variable "route_route_table_id" {
  description = "The ID of the routing table"
  type        = string
}
variable "route_transit_gateway_id" {
  description = "Identifier of an EC2 Transit Gateway"
  type        = string
  default     = null
}
variable "route_vpc_endpoint_id" {
  description = "Identifier of a VPC Endpoint"
  type        = string
  default     = null
}
variable "route_vpc_peering_connection_id" {
  description = "Identifier of a VPC peering"
  type        = string
  default     = null
}
