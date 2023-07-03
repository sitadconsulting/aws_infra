variable "route_table_propagating_vgws" {
  description = "A list of virtual gateways for propagation"
  type        = list(string)
  default     = []
}
variable "route_table_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "route_table_vpc_id" {
  description = "The VPC ID"
  type        = string
}
variable "route_table_route" {
  description = "A list of route objects"
  type        = list(object({
    cidr_block                 = optional(string)
    destination_prefix_list_id = optional(string)
    ipv6_cidr_block            = optional(string)
    carrier_gateway_id         = optional(string)
    core_network_arn           = optional(string)
    egress_only_gateway_id     = optional(string)
    gateway_id                 = optional(string)
    local_gateway_id           = optional(string)
    network_interface_id       = optional(string)
    transit_gateway_id         = optional(string)
    vpc_endpoint_id            = optional(string)
    vpc_peering_connection_id  = optional(string)
  }))
  default     = []
}
