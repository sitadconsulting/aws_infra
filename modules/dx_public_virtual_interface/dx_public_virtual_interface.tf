resource "aws_dx_public_virtual_interface" "dx_public_virtual_interface" {
  address_family        = var.dx_public_virtual_interface_address_family
  amazon_address        = var.dx_public_virtual_interface_amazon_address
  bgp_asn               = var.dx_public_virtual_interface_bgp_asn
  bgp_auth_key          = var.dx_public_virtual_interface_bgp_auth_key
  connection_id         = var.dx_public_virtual_interface_connection_id
  customer_address      = var.dx_public_virtual_interface_customer_address
  name                  = var.dx_public_virtual_interface_name
  route_filter_prefixes = var.dx_public_virtual_interface_route_filter_prefixes
  tags                  = var.dx_public_virtual_interface_tags
  vlan                  = var.dx_public_virtual_interface_vlan
}
