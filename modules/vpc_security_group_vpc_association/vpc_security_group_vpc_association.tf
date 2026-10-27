resource "aws_vpc_security_group_vpc_association" "vpc_security_group_vpc_association" {
  security_group_id = var.vpc_security_group_vpc_association_security_group_id
  vpc_id            = var.vpc_security_group_vpc_association_vpc_id
}
