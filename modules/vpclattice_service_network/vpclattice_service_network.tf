resource "aws_vpclattice_service_network" "vpclattice_service_network" {
  name      = var.vpclattice_service_network_name
  auth_type = var.vpclattice_service_network_auth_type
  tags      = var.vpclattice_service_network_tags
}
