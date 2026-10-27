resource "aws_api_gateway_domain_name_access_association" "api_gateway_domain_name_access_association" {
  access_association_source      = var.api_gateway_domain_name_access_association_access_association_source
  access_association_source_type = var.api_gateway_domain_name_access_association_access_association_source_type
  domain_name_arn                = var.api_gateway_domain_name_access_association_domain_name_arn
  tags                           = var.api_gateway_domain_name_access_association_tags
}
