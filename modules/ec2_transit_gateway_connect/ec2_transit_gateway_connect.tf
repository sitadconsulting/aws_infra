resource "aws_ec2_transit_gateway_connect" "ec2_transit_gateway_connect" {
  protocol                                        = var.ec2_transit_gateway_connect_protocol
  tags                                            = var.ec2_transit_gateway_connect_tags
  transit_gateway_default_route_table_association = var.ec2_transit_gateway_connect_transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = var.ec2_transit_gateway_connect_transit_gateway_default_route_table_propagation
  transit_gateway_id                              = var.ec2_transit_gateway_connect_transit_gateway_id
  transport_attachment_id                         = var.ec2_transit_gateway_connect_transport_attachment_id 
}
