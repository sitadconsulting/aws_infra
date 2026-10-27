resource "aws_api_gateway_deployment" "api_gateway_deployment" {
  description       = var.api_gateway_deployment_description
  rest_api_id       = var.api_gateway_deployment_rest_api_id
  triggers          = var.api_gateway_deployment_triggers
  variables         = var.api_gateway_deployment_variables

  lifecycle {
    create_before_destroy = true
  }
}
