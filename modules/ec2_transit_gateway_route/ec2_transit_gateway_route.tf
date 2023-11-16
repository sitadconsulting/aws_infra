resource "aws_ec2_transit_gateway_route" "ec2_transit_gateway_route" {
  blackhole                      = var.ec2_transit_gateway_route_blackhole
  destination_cidr_block         = var.ec2_transit_gateway_route_destination_cidr_block
  transit_gateway_attachment_id  = var.ec2_transit_gateway_route_transit_gateway_attachment_id
  transit_gateway_route_table_id = var.ec2_transit_gateway_route_transit_gateway_route_table_id
}
