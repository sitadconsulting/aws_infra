resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "ec2_transit_gateway_vpc_attachment_accepter" {
  transit_gateway_attachment_id                   = var.ec2_transit_gateway_vpc_attachment_accepter_transit_gateway_attachment_id
  tags                                            = var.ec2_transit_gateway_vpc_attachment_accepter_tags
  transit_gateway_default_route_table_association = var.ec2_transit_gateway_vpc_attachment_accepter_transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = var.ec2_transit_gateway_vpc_attachment_accepter_transit_gateway_default_route_table_propagation
}
