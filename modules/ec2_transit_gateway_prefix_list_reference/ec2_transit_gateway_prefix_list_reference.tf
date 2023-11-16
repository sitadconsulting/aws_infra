resource "aws_ec2_transit_gateway_prefix_list_reference" "ec2_transit_gateway_prefix_list_reference" {
  blackhole                      = var.ec2_transit_gateway_prefix_list_reference_blackhole
  prefix_list_id                 = var.ec2_transit_gateway_prefix_list_reference_prefix_list_id
  transit_gateway_attachment_id  = var.ec2_transit_gateway_prefix_list_reference_transit_gateway_attachment_id
  transit_gateway_route_table_id = var.ec2_transit_gateway_prefix_list_reference_transit_gateway_route_table_id
}
