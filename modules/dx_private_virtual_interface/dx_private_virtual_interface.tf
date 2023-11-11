resource "aws_dx_private_virtual_interface" "dx_private_virtual_interface" {
  address_family   = var.dx_private_virtual_interface_address_family
  amazon_address   = var.dx_private_virtual_interface_amazon_address
  bgp_asn          = var.dx_private_virtual_interface_bgp_asn
  bgp_auth_key     = var.dx_private_virtual_interface_bgp_auth_key
  connection_id    = var.dx_private_virtual_interface_connection_id
  customer_address = var.dx_private_virtual_interface_customer_address
  dx_gateway_id    = var.dx_private_virtual_interface_dx_gateway_id
  mtu              = var.dx_private_virtual_interface_mtu
  name             = var.dx_private_virtual_interface_name
  sitelink_enabled = var.dx_private_virtual_interface_sitelink_enabled
  tags             = var.dx_private_virtual_interface_tags
  vlan             = var.dx_private_virtual_interface_vlan
  vpn_gateway_id   = var.dx_private_virtual_interface_vpn_gateway_id
}
