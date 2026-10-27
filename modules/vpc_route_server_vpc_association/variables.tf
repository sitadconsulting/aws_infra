variable "vpc_route_server_vpc_association_route_server_id" {
  description = "(Required) Unique identifier for the route server to be associated"
  type        = string
}
variable "vpc_route_server_vpc_association_vpc_id" {
  description = "(Required) ID of the VPC to associate with the route server"
  type        = string
}
