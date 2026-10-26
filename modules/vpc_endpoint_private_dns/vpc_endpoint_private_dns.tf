resource "aws_vpc_endpoint_private_dns" "vpc_endpoint_private_dns" {
  private_dns_enabled = var.vpc_endpoint_private_dns_private_dns_enabled
  vpc_endpoint_id     = var.vpc_endpoint_private_dns_vpc_endpoint_id
}
