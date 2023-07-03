resource "aws_route_table_association" "route_table_association" {
  gateway_id     = var.route_table_association_gateway_id
  route_table_id = var.route_table_association_route_table_id
  subnet_id      = var.route_table_association_subnet_id
}
