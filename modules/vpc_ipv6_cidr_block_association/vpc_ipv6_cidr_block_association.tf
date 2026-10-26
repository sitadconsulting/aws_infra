resource "aws_vpc_ipv6_cidr_block_association" "vpc_ipv6_cidr_block_association" {
  assign_generated_ipv6_cidr_block = var.vpc_ipv6_cidr_block_association_assign_generated_ipv6_cidr_block
  ipv6_cidr_block                  = var.vpc_ipv6_cidr_block_association_ipv6_cidr_block
  ipv6_ipam_pool_id                = var.vpc_ipv6_cidr_block_association_ipv6_ipam_pool_id
  ipv6_netmask_length              = var.vpc_ipv6_cidr_block_association_ipv6_netmask_length
  ipv6_pool                        = var.vpc_ipv6_cidr_block_association_ipv6_pool
  vpc_id                           = var.vpc_ipv6_cidr_block_association_vpc_id
}
