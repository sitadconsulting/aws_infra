resource "aws_dx_hosted_private_virtual_interface_accepter" "dx_hosted_private_virtual_interface_accepter" {
  dx_gateway_id                    = var.dx_hosted_private_virtual_interface_accepter_dx_gateway_id
  prefix_pool_allocated_count_ipv4 = var.dx_hosted_private_virtual_interface_accepter_prefix_pool_allocated_count_ipv4
  prefix_pool_allocated_count_ipv6 = var.dx_hosted_private_virtual_interface_accepter_prefix_pool_allocated_count_ipv6
  virtual_interface_id             = var.dx_hosted_private_virtual_interface_accepter_virtual_interface_id
  vpn_gateway_id                   = var.dx_hosted_private_virtual_interface_accepter_vpn_gateway_id 
  tags                             = var.dx_hosted_private_virtual_interface_accepter_tags
}
