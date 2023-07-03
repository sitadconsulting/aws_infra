resource "aws_vpc_endpoint_service_allowed_principal" "vpc_endpoint_service_allowed_principal" {
  principal_arn           = var.vpc_endpoint_service_allowed_principal_principal_arn
  vpc_endpoint_service_id = var.vpc_endpoint_service_allowed_principal_vpc_endpoint_service_id
}
