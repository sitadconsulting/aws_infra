resource "aws_network_interface_attachment" "network_interface_attachment" {
  instance_id          = var.network_interface_attachment_instance_id
  network_interface_id = var.network_interface_attachment_network_interface_id
  device_index         = var.network_interface_attachment_device_index
  network_card_index   = var.network_interface_attachment_network_card_index
}
