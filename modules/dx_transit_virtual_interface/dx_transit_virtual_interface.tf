resource "aws_dx_transit_virtual_interface" "dx_transit_virtual_interface" {
  address_family                   = var.dx_transit_virtual_interface_address_family
  amazon_address                   = var.dx_transit_virtual_interface_amazon_address
  bgp_asn                          = var.dx_transit_virtual_interface_bgp_asn
  bgp_asn_long                     = var.dx_transit_virtual_interface_bgp_asn_long
  bgp_auth_key                     = var.dx_transit_virtual_interface_bgp_auth_key
  connection_id                    = var.dx_transit_virtual_interface_connection_id
  customer_address                 = var.dx_transit_virtual_interface_customer_address
  dx_gateway_id                    = var.dx_transit_virtual_interface_dx_gateway_id
  mtu                              = var.dx_transit_virtual_interface_mtu
  name                             = var.dx_transit_virtual_interface_name
  prefix_pool_allocated_count_ipv4 = var.dx_transit_virtual_interface_prefix_pool_allocated_count_ipv4
  prefix_pool_allocated_count_ipv6 = var.dx_transit_virtual_interface_prefix_pool_allocated_count_ipv6
  rate_limit                       = var.dx_transit_virtual_interface_rate_limit
  sitelink_enabled                 = var.dx_transit_virtual_interface_sitelink_enabled
  tags                             = var.dx_transit_virtual_interface_tags
  vlan                             = var.dx_transit_virtual_interface_vlan
}
