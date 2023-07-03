resource "aws_vpc_endpoint_security_group_association" "vpc_endpoint_security_group_association" {
  replace_default_association = var.vpc_endpoint_security_group_association_replace_default_association 
  security_group_id           = var.vpc_endpoint_security_group_association_security_group_id
  vpc_endpoint_id             = var.vpc_endpoint_security_group_association_vpc_endpoint_id
}
