resource "aws_dx_bgp_peer" "dx_bgp_peer" {
  address_family       = var.dx_bgp_peer_address_family
  bgp_asn              = var.dx_bgp_peer_bgp_asn
  virtual_interface_id = var.dx_bgp_peer_virtual_interface_id
  amazon_address       = var.dx_bgp_peer_amazon_address
  bgp_auth_key         = var.dx_bgp_peer_bgp_auth_key
  customer_address     = var.dx_bgp_peer_customer_address
}
