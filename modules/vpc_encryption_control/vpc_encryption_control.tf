resource "aws_vpc_encryption_control" "vpc_encryption_control" {
  egress_only_internet_gateway_exclusion = var.vpc_encryption_control_egress_only_internet_gateway_exclusion
  elastic_file_system_exclusion          = var.vpc_encryption_control_elastic_file_system_exclusion
  internet_gateway_exclusion             = var.vpc_encryption_control_internet_gateway_exclusion
  lambda_exclusion                       = var.vpc_encryption_control_lambda_exclusion
  mode                                   = var.vpc_encryption_control_mode
  nat_gateway_exclusion                  = var.vpc_encryption_control_nat_gateway_exclusion
  tags                                   = var.vpc_encryption_control_tags
  virtual_private_gateway_exclusion      = var.vpc_encryption_control_virtual_private_gateway_exclusion
  vpc_id                                 = var.vpc_encryption_control_vpc_id
  vpc_lattice_exclusion                  = var.vpc_encryption_control_vpc_lattice_exclusion
  vpc_peering_exclusion                  = var.vpc_encryption_control_vpc_peering_exclusion
}
