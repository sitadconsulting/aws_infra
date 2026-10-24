resource "aws_network_interface_sg_attachment" "network_interface_sg_attachment" {
  network_interface_id = var.network_interface_sg_attachment_network_interface_id
  security_group_id    = var.network_interface_sg_attachment_security_group_id
}
