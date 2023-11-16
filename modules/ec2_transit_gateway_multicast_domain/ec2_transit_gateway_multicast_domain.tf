resource "aws_ec2_transit_gateway_multicast_domain" "ec2_transit_gateway_multicast_domain" {
  auto_accept_shared_associations = var.ec2_transit_gateway_multicast_domain_auto_accept_shared_associations
  igmpv2_support                  = var.ec2_transit_gateway_multicast_domain_igmpv2_support
  static_sources_support          = var.ec2_transit_gateway_multicast_domain_static_sources_support
  tags                            = var.ec2_transit_gateway_multicast_domain_tags
  transit_gateway_id              = var.ec2_transit_gateway_multicast_domain_transit_gateway_id

}
