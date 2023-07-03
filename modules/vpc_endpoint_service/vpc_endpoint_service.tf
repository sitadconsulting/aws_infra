resource "aws_vpc_endpoint_service" "vpc_endpoint_service" {
  acceptance_required        = var.vpc_endpoint_service_acceptance_required
  allowed_principals         = var.vpc_endpoint_service_allowed_principals
  gateway_load_balancer_arns = var.vpc_endpoint_service_gateway_load_balancer_arns
  network_load_balancer_arns = var.vpc_endpoint_service_network_load_balancer_arns
  private_dns_name           = var.vpc_endpoint_service_private_dns_name
  supported_ip_address_types = var.vpc_endpoint_service_supported_ip_address_types
  tags                       = var.vpc_endpoint_service_tags
}
