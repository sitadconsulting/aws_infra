variable "vpc_route_server_propagation_route_server_id" {
  description = "(Required) Unique identifier for the route server to be associated"
  type        = string
}
variable "vpc_route_server_propagation_route_table_id" {
  description = "(Required) ID of the route table to which route server will propagate routes"
  type        = string
}
