resource "aws_dx_gateway" "dx_gateway" {
  amazon_side_asn = var.dx_gateway_amazon_side_asn
  name            = var.dx_gateway_name
}
