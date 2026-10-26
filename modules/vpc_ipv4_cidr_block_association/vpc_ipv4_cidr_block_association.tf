resource "aws_vpc_ipv4_cidr_block_association" "vpc_ipv4_cidr_block_association" {
  cidr_block          = var.vpc_ipv4_cidr_block_association_cidr_block
  ipv4_ipam_pool_id   = var.vpc_ipv4_cidr_block_association_ipv4_ipam_pool_id
  ipv4_netmask_length = var.vpc_ipv4_cidr_block_association_ipv4_netmask_length
  vpc_id              = var.vpc_ipv4_cidr_block_association_vpc_id
}
