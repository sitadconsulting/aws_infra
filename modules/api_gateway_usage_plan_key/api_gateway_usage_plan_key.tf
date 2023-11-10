resource "aws_api_gateway_usage_plan_key" "api_gateway_usage_plan_key" {
  key_id        = var.api_gateway_usage_plan_key_key_id
  key_type      = var.api_gateway_usage_plan_key_key_type
  usage_plan_id = var.api_gateway_usage_plan_key_usage_plan_id
}
