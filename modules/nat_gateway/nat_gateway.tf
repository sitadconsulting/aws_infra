resource "aws_nat_gateway" "nat_gateway" {
  allocation_id     = var.nat_gateway_allocation_id
  connectivity_type = var.nat_gateway_connectivity_type
  private_ip        = var.nat_gateway_private_ip
  subnet_id         = var.nat_gateway_subnet_id
  tags              = var.nat_gateway_tags
}
