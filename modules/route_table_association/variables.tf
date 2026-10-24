variable "route_table_association_gateway_id" {
  description = "(Optional) The gateway ID to create an association. Conflicts with subnet_id"
  type        = string
  default     = null
}
variable "route_table_association_route_table_id" {
  description = "(Required) The ID of the routing table to associate with"
  type        = string
}
variable "route_table_association_subnet_id" {
  description = "(Optional) The subnet ID to create an association. Conflicts with gateway_id"
  type        = string
  default     = null
}
