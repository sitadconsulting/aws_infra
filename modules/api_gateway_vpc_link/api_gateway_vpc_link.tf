resource "aws_api_gateway_vpc_link" "api_gateway_vpc_link" {
  name        = var.api_gateway_vpc_link_name
  description = var.api_gateway_vpc_link_description
  target_arns = var.api_gateway_vpc_link_target_arns
  tags        = var.api_gateway_vpc_link_tags
}
