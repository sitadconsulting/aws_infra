variable "route_table_propagating_vgws" {
  description = "(Optional) A list of virtual gateways for propagation"
  type        = list(string)
  default     = null
}
variable "route_table_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "route_table_vpc_id" {
  description = "(Required) The VPC ID"
  type        = string
}
variable "route_table_route" {
  description = "(Optional) A list of route objects. This argument is processed in attribute-as-blocks mode. This means that omitting this argument is interpreted as ignoring any existing routes. To remove all managed routes an empty list should be specified"
  type        = list(object({
    cidr_block                 = optional(string)
    destination_prefix_list_id = optional(string)
    ipv6_cidr_block            = optional(string)
    carrier_gateway_id         = optional(string)
    core_network_arn           = optional(string)
    egress_only_gateway_id     = optional(string)
    gateway_id                 = optional(string)
    local_gateway_id           = optional(string)
    nat_gateway_id             = optional(string)
    network_interface_id       = optional(string)
    odb_network_arn            = optional(string)
    transit_gateway_id         = optional(string)
    vpc_endpoint_id            = optional(string)
    vpc_peering_connection_id  = optional(string)
  }))
  default     = []
}
