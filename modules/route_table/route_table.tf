resource "aws_route_table" "route_table" {
  propagating_vgws = var.route_table_propagating_vgws
  tags             = var.route_table_tags
  vpc_id           = var.route_table_vpc_id

  dynamic "route" {
    for_each = var.route_table_route
      content {
        cidr_block                 = route.value["cidr_block"]
        destination_prefix_list_id = route.value["destination_prefix_list_id"]
        ipv6_cidr_block            = route.value["ipv6_cidr_block"]
        carrier_gateway_id         = route.value["carrier_gateway_id"]
        core_network_arn           = route.value["core_network_arn"]
        egress_only_gateway_id     = route.value["egress_only_gateway_id"]
        gateway_id                 = route.value["gateway_id"]
        local_gateway_id           = route.value["local_gateway_id"]
        network_interface_id       = route.value["network_interface_id"]
        transit_gateway_id         = route.value["transit_gateway_id"]
        vpc_endpoint_id            = route.value["vpc_endpoint_id"]
        vpc_peering_connection_id  = route.value["vpc_peering_connection_id"]
      }
  }
}
