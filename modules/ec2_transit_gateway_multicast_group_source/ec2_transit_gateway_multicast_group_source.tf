resource "aws_ec2_transit_gateway_multicast_group_source" "ec2_transit_gateway_multicast_group_source" {
  group_ip_address                    = var.ec2_transit_gateway_multicast_group_source_group_ip_address
  network_interface_id                = var.ec2_transit_gateway_multicast_group_source_network_interface_id
  transit_gateway_multicast_domain_id = var.ec2_transit_gateway_multicast_group_source_transit_gateway_multicast_domain_id
}
