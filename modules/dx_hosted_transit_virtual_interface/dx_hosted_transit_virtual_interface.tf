resource "aws_dx_hosted_transit_virtual_interface" "dx_hosted_transit_virtual_interface" {
  address_family   = var.dx_hosted_transit_virtual_interface_address_family
  amazon_address   = var.dx_hosted_transit_virtual_interface_amazon_address
  bgp_asn          = var.dx_hosted_transit_virtual_interface_bgp_asn
  bgp_auth_key     = var.dx_hosted_transit_virtual_interface_bgp_auth_key
  connection_id    = var.dx_hosted_transit_virtual_interface_connection_id
  customer_address = var.dx_hosted_transit_virtual_interface_customer_address
  mtu              = var.dx_hosted_transit_virtual_interface_mtu
  name             = var.dx_hosted_transit_virtual_interface_name
  owner_account_id = var.dx_hosted_transit_virtual_interface_owner_account_id
  vlan             = var.dx_hosted_transit_virtual_interface_vlan 
}
