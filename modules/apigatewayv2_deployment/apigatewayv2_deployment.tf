resource "aws_apigatewayv2_deployment" "apigatewayv2_deployment" {
  api_id      = var.apigatewayv2_deployment_api_id
  description = var.apigatewayv2_deployment_description
  triggers    = var.apigatewayv2_deployment_triggers

  lifecycle {
    create_before_destroy = true
  }
}
