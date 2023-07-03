resource "aws_opensearchserverless_vpc_endpoint" "opensearchserverless_vpc_endpoint" {
  name               = var.opensearchserverless_vpc_endpoint_name
  security_group_ids = var.opensearchserverless_vpc_endpoint_security_group_id
  subnet_ids         = var.opensearchserverless_vpc_endpoint_subnet_ids
  vpc_id             = var.opensearchserverless_vpc_endpoint_vpc_id
}
