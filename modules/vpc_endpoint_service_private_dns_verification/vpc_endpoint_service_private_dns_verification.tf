resource "aws_vpc_endpoint_service_private_dns_verification" "vpc_endpoint_service_private_dns_verification" {
  service_id            = var.vpc_endpoint_service_private_dns_verification_service_id
  wait_for_verification = var.vpc_endpoint_service_private_dns_verification_wait_for_verification
}
