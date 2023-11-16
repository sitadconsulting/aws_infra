resource "aws_ec2_transit_gateway_peering_attachment_accepter" "ec2_transit_gateway_peering_attachment_accepter" {
  transit_gateway_attachment_id = var.ec2_transit_gateway_peering_attachment_accepter_transit_gateway_attachment_id
  tags                          = var.ec2_transit_gateway_peering_attachment_accepter_tags
}
