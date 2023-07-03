resource "aws_subnet" "subnet" {
  assign_ipv6_address_on_creation                = var.subnet_assign_ipv6_address_on_creation
  availability_zone                              = var.subnet_availability_zone
  availability_zone_id                           = var.subnet_availability_zone_id
  cidr_block                                     = var.subnet_cidr_block
  customer_owned_ipv4_pool                       = var.subnet_customer_owned_ipv4_pool
  enable_dns64                                   = var.subnet_enable_dns64
  enable_lni_at_device_index                     = var.subnet_enable_lni_at_device_index
  enable_resource_name_dns_aaaa_record_on_launch = var.subnet_enable_resource_name_dns_aaaa_record_on_launch
  enable_resource_name_dns_a_record_on_launch    = var.subnet_enable_resource_name_dns_a_record_on_launch
  ipv6_cidr_block                                = var.subnet_ipv6_cidr_block
  ipv6_native                                    = var.subnet_ipv6_native
  map_customer_owned_ip_on_launch                = var.subnet_map_customer_owned_ip_on_launch
  map_public_ip_on_launch                        = var.subnet_map_public_ip_on_launch
  outpost_arn                                    = var.subnet_outpost_arn
  private_dns_hostname_type_on_launch            = var.subnet_private_dns_hostname_type_on_launch
  vpc_id                                         = var.subnet_vpc_id
  tags                                           = var.subnet_tags
}
