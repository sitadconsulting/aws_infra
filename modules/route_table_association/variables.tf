variable "route_table_association_gateway_id" {
  description = "The gateway ID to create an association. Conflicts with subnet_id"
  type        = string
  default     = null
}
variable "route_table_association_route_table_id" {
  description = "The ID of the routing table to associate with"
  type        = string
}
variable "route_table_association_subnet_id" {
  description = "The subnet ID to create an association. Conflicts with gateway_id"
  type        = string
  default     = ""
}
