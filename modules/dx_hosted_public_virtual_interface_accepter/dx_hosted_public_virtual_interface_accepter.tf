resource "aws_dx_hosted_public_virtual_interface_accepter" "dx_hosted_public_virtual_interface_accepter" {
  virtual_interface_id = var.dx_hosted_public_virtual_interface_accepter_virtual_interface_id
  tags                 = var.dx_hosted_public_virtual_interface_accepter_tags 
}
