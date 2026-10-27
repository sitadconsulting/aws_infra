resource "aws_vpc_route_server_propagation" "vpc_route_server_propagation" {
  route_server_id  = var.vpc_route_server_propagation_route_server_id
  route_table_id   = var.vpc_route_server_propagation_route_table_id
}
