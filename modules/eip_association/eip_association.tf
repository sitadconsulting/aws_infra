resource "aws_eip_association" "eip_association" {
  allocation_id        = var.eip_association_allocation_id
  allow_reassociation  = var.eip_association_allow_reassociation
  instance_id          = var.eip_association_instance_id
  network_interface_id = var.eip_association_network_interface_id
  private_ip_address   = var.eip_association_private_ip_address
}
