resource "aws_vpc_endpoint_subnet_association" "vpc_endpoint_subnet_association" {
  subnet_id       = var.vpc_endpoint_subnet_association_subnet_id
  vpc_endpoint_id = var.vpc_endpoint_subnet_association_vpc_endpoint_id
}
