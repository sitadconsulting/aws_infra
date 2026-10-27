variable "vpc_route_server_endpoint_route_server_id" {
  description = "(Required) ID of the route server for which to create an endpoint"
  type        = string
}
variable "vpc_route_server_endpoint_subnet_id" {
  description = "(Required) ID of the subnet in which to create the route server endpoint"
  type        = string
}
variable "vpc_route_server_endpoint_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
