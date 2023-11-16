resource "aws_ec2_transit_gateway_route_table" "ec2_transit_gateway_route_table" {
  transit_gateway_id = var.ec2_transit_gateway_route_table_transit_gateway_id
  tags               = var.ec2_transit_gateway_route_table_tags
}
