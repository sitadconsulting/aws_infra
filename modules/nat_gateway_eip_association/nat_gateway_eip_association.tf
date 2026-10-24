resource "aws_nat_gateway_eip_association" "nat_gateway_eip_association" {
  allocation_id  = var.nat_gateway_eip_association_allocation_id
  nat_gateway_id = var.nat_gateway_eip_association_nat_gateway_id
}
