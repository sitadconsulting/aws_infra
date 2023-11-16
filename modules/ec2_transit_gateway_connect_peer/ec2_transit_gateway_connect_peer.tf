resource "aws_ec2_transit_gateway_connect_peer" "ec2_transit_gateway_connect_peer" {
  bgp_asn                       = var.ec2_transit_gateway_connect_peer_bgp_asn
  inside_cidr_blocks            = var.ec2_transit_gateway_connect_peer_inside_cidr_blocks
  peer_address                  = var.ec2_transit_gateway_connect_peer_peer_address
  tags                          = var.ec2_transit_gateway_connect_peer_tags
  transit_gateway_address       = var.ec2_transit_gateway_connect_peer_transit_gateway_address
  transit_gateway_attachment_id = var.ec2_transit_gateway_connect_peer_transit_gateway_attachment_id
}
