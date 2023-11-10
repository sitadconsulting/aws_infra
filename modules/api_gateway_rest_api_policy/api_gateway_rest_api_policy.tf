resource "aws_api_gateway_rest_api_policy" "api_gateway_rest_api_policy" {
  rest_api_id = var.api_gateway_rest_api_policy_rest_api_id
  policy      = var.api_gateway_rest_api_policy_policy
}
