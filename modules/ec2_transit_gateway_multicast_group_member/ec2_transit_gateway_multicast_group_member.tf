resource "aws_ec2_transit_gateway_multicast_group_member" "ec2_transit_gateway_multicast_group_member" {
  group_ip_address                    = var.ec2_transit_gateway_multicast_group_member_group_ip_address
  network_interface_id                = var.ec2_transit_gateway_multicast_group_member_network_interface_id
  transit_gateway_multicast_domain_id = var.ec2_transit_gateway_multicast_group_member_transit_gateway_multicast_domain_id
}
