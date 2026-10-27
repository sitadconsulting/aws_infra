resource "aws_vpc_route_server_endpoint" "vpc_route_server_endpoint" {
  route_server_id = var.vpc_route_server_endpoint_route_server_id
  subnet_id       = var.vpc_route_server_endpoint_subnet_id
  tags            = var.vpc_route_server_endpoint_tags
}
