resource "aws_api_gateway_vpc_link" "api_gateway_vpc_link" {
  description = var.api_gateway_vpc_link_description
  name        = var.api_gateway_vpc_link_name
  tags        = var.api_gateway_vpc_link_tags
  target_arns = var.api_gateway_vpc_link_target_arns
}
