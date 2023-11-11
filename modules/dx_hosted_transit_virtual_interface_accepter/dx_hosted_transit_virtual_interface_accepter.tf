resource "aws_dx_hosted_transit_virtual_interface_accepter" "dx_hosted_transit_virtual_interface_accepter" {
  dx_gateway_id        = var.dx_hosted_transit_virtual_interface_accepter_dx_gateway_id
  virtual_interface_id = var.dx_hosted_transit_virtual_interface_accepter_virtual_interface_id
  tags                 = var.dx_hosted_transit_virtual_interface_accepter_tags
}
