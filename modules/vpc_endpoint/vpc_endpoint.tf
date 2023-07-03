resource "aws_vpc_endpoint" "vpc_endpoint" {
  auto_accept         = var.vpc_endpoint_auto_accept
  ip_address_type     = var.vpc_endpoint_ip_address_type
  policy              = var.vpc_endpoint_policy
  private_dns_enabled = var.vpc_endpoint_private_dns_enabled
  routa_table_ids     = var.vpc_endpoint_route_table_ids
  security_group_ids  = var.vpc_endpoint_security_group_id
  service_name        = var.vpc_endpoint_service_name
  subnet_ids          = var.vpc_endpoint_subnet_ids
  tags                = var.vpc_endpoint_tags
  vpc_id              = var.vpc_endpoint_vpc_id
  vpc_endpoint_type   = var.vpc_endpoint_vpc_endpoint_type

  dynamic "dns_options" {
    for_each = var.vpc_endpoint_dns_options
      content {
        dns_record_ip_type = dns_options.value["dns_record_ip_type"]
      }
  }
}
