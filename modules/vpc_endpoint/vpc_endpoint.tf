resource "aws_vpc_endpoint" "vpc_endpoint" {
  auto_accept                = var.vpc_endpoint_auto_accept
  ip_address_type            = var.vpc_endpoint_ip_address_type
  policy                     = var.vpc_endpoint_policy
  private_dns_enabled        = var.vpc_endpoint_private_dns_enabled
  resource_configuration_arn = var.vpc_endpoint_resource_configuration_arn
  route_table_ids            = var.vpc_endpoint_route_table_ids
  security_group_ids         = var.vpc_endpoint_security_group_id
  service_name               = var.vpc_endpoint_service_name
  service_network_arn        = var.vpc_endpoint_service_network_arn
  service_region             = var.vpc_endpoint_service_region
  subnet_ids                 = var.vpc_endpoint_subnet_ids
  tags                       = var.vpc_endpoint_tags
  vpc_endpoint_type          = var.vpc_endpoint_vpc_endpoint_type
  vpc_id                     = var.vpc_endpoint_vpc_id

  dynamic "dns_options" {
    for_each = var.vpc_endpoint_dns_options
      content {
        dns_record_ip_type                             = dns_options.value["dns_record_ip_type"]
        private_dns_only_for_inbound_resolver_endpoint = dns_options.value["private_dns_only_for_inbound_resolver_endpoint"] 
        private_dns_preference                         = dns_options.value["private_dns_preference"]
        private_dns_specified_domains                  = dns_options.value["private_dns_specified_domains"]
      }
  }
  dynamic "subnet_configuration" {
    for_each = var.vpc_endpoint_subnet_configuration
      content {
        ipv4      = subnet_configuration.value["ipv4"]
        ipv6      = subnet_configuration.value["ipv6"]
        subnet_id = subnet_configuration.value["subnet_id"]
      }
  }
}
