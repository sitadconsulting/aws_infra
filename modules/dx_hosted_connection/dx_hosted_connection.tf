resource "aws_dx_hosted_connection" "dx_hosted_connection" {
  bandwidth        = var.dx_hosted_connection_bandwidth
  connection_id    = var.dx_hosted_connection_connection_id
  name             = var.dx_hosted_connection_name
  owner_account_id = var.dx_hosted_connection_owner_account_id
  vlan             = var.dx_hosted_connection_vlan
}
