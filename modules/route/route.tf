resource "aws_route" "route" {
  carrier_gateway_id          = var.route_carrier_gateway_id
  core_network_arn            = var.route_core_network_arn
  destination_cidr_block      = var.route_destination_cidr_block
  destination_ipv6_cidr_block = var.route_destination_ipv6_cidr_block
  destination_prefix_list_id  = var.route_destination_prefix_list_id
  egress_only_gateway_id      = var.route_egress_only_gateway_id
  gateway_id                  = var.route_gateway_id
  local_gateway_id            = var.route_local_gateway_id
  nat_gateway_id              = var.route_nat_gateway_id
  network_interface_id        = var.route_network_interface_id
  route_table_id              = var.route_route_table_id
  transit_gateway_id          = var.route_transit_gateway_id
  vpc_endpoint_id             = var.route_vpc_endpoint_id
  vpc_peering_connection_id   = var.route_vpc_peering_connection_id
}
