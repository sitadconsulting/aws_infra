resource "aws_vpc_block_public_access_exclusion" "vpc_block_public_access_exclusion" {
  internet_gateway_exclusion_mode = var.vpc_block_public_access_exclusion_internet_gateway_exclusion_mode
  subnet_id                       = var.vpc_block_public_access_exclusion_subnet_id
  tags                            = var.vpc_block_public_access_exclusion_tags
  vpc_id                          = var.vpc_block_public_access_exclusion_vpc_id
}
