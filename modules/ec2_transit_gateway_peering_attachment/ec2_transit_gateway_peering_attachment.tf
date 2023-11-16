resource "aws_ec2_transit_gateway_peering_attachment" "ec2_transit_gateway_peering_attachment" {
  peer_account_id         = var.ec2_transit_gateway_peering_attachment_peer_account_id
  peer_region             = var.ec2_transit_gateway_peering_attachment_peer_region
  peer_transit_gateway_id = var.ec2_transit_gateway_peering_attachment_peer_transit_gateway_id
  tags                    = var.ec2_transit_gateway_peering_attachment_tags
  transit_gateway_id      = var.ec2_transit_gateway_peering_attachment_transit_gateway_id
}
