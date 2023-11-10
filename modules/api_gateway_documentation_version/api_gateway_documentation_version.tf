resource "aws_api_gateway_documentation_version" "api_gateway_documentation_version" {
  version     = var.api_gateway_documentation_version_version
  rest_api_id = var.api_gateway_documentation_version_rest_api_id
  description = var.api_gateway_documentation_version_description
}
