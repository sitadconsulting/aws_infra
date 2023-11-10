resource "aws_api_gateway_resource" "api_gateway_resource" {
  parent_id   = var.api_gateway_resource_parent_id
  path        = var.api_gateway_resource_path
  path_part   = var.api_gateway_resource_path_part
  rest_api_id = var.api_gateway_resource_rest_api_id
}
