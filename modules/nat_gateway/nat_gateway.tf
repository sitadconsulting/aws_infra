resource "aws_nat_gateway" "nat_gateway" {
  allocation_id                      = var.nat_gateway_allocation_id
  availability_mode                  = var.nat_gateway_availability_mode
  connectivity_type                  = var.nat_gateway_connectivity_type
  private_ip                         = var.nat_gateway_private_ip
  subnet_id                          = var.nat_gateway_subnet_id
  secondary_allocation_ids           = var.nat_gateway_secondary_allocation_ids
  secondary_private_ip_address_count = var.nat_gateway_secondary_private_ip_address_count
  secondary_private_ip_addresses     = var.nat_gateway_secondary_private_ip_addresses
  tags                               = var.nat_gateway_tags
  vpc_id                             = var.nat_gateway_vpc_id

  dynamic "availability_zone_address" {
    for_each = var.nat_gateway_availability_zone_address
      content {
        allocation_ids       = availability_zone_address.value["allocation_ids"]
        availability_zone    = availability_zone_address.value["availability_zone"]
        availability_zone_id = availability_zone_address.value["availability_zone_id"]
      }
  }
}
