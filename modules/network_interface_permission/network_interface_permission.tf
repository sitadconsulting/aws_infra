resource "aws_network_interface_permission" "network_interface_permission" {
  aws_account_id       = var.network_interface_permission_aws_account_id
  network_interface_id = var.network_interface_permission_network_interface_id
  permission           = var.network_interface_permission_permission
}
