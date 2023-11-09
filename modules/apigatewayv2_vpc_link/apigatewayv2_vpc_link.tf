resource "aws_apigatewayv2_vpc_link" "apigatewayv2_vpc_link" {
  name               = var.apigatewayv2_vpc_link_name
  security_group_ids = var.apigatewayv2_vpc_link_security_group_ids
  subnet_ids         = var.apigatewayv2_vpc_link_subnet_ids
  tags               = var.apigatewayv2_vpc_link_tags 
}
