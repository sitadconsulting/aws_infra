resource "aws_vpclattice_service_network_vpc_association" "vpclattice_service_network_vpc_association" {
  vpc_identifier             = var.vpclattice_service_network_vpc_association_vpc_identifier
  service_network_identifier = var.vpclattice_service_network_vpc_association_sefrvice_network_identifier
  security_group_ids         = var.vpclattice_service_network_vpc_association_security_group_ids
  tags                       = var.vpclattice_service_network_vpc_association_tags
}
