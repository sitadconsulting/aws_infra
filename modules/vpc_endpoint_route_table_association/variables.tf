variable "vpc_endpoint_route_table_association_route_table_id" {
  description = "Identifier of the EC2 Route Table to be associated with the VPC Endpoint"
  type        = string
}
variable "vpc_endpoint_route_table_association_vpc_endpoint_id" {
  description = "Identifier of the VPC Endpoint with which the EC2 Route Table will be associated"
  type        = string
}
