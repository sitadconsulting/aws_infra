resource "aws_vpc_endpoint_connection_accepter" "vpc_endpoint_connection_accepter" {
  vpc_endpoint_id         = var.vpc_endpoint_connection_accepter_vpc_endpoint_id
  vpc_endpoint_service_id = var.vpc_endpoint_connection_accepter_vpc_endpoint_service_id
}
