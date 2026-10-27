resource "aws_api_gateway_base_path_mapping" "api_gateway_base_path_mapping" {
  api_id         = var.api_gateway_base_path_mapping_api_id
  base_path      = var.api_gateway_base_path_mapping_base_path
  domain_name    = var.api_gateway_base_path_mapping_domain_name
  domain_name_id = var.api_gateway_base_path_mapping_domain_name_id
  stage_name     = var.api_gateway_base_path_mapping_stage_name
}
