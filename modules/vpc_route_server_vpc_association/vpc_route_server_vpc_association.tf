resource "aws_vpc_route_server_vpc_association" "vpc_route_server_vpc_association" {
  route_server_id = var.vpc_route_server_vpc_association_route_server_id
  vpc_id          = var.vpc_route_server_vpc_association_vpc_id
}
