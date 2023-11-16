resource "aws_ec2_transit_gateway_multicast_domain_association" "ec2_transit_gateway_multicast_domain_association" {
  subnet_id                           = var.ec2_transit_gateway_multicast_domain_association_subnet_id
  transit_gateway_attachment_id       = var.ec2_transit_gateway_multicast_domain_association_transit_gateway_attachment_id
  transit_gateway_multicast_domain_id = var.ec2_transit_gateway_multicast_domain_association_transit_gateway_multicast_domain_id
}
