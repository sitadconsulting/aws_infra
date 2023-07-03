resource "aws_vpclattice_service_network_service_association" "vpclattice_service_network_service_association" {
  service_identifier         = var.vpclattice_service_network_service_association_service_identifier
  service_network_identifier = var.vpclattice_service_network_service_association_service_network_identifier
  tags                       = var.vpclattice_service_network_service_association_tags
}
