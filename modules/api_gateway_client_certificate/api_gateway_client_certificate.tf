resource "aws_api_gateway_client_certificate" "api_gateway_client_certificate" {
  description = var.api_gateway_client_certificate_description
  tags        - var.api_gateway_client_certificate_tags
}
