resource "aws_vpc_dhcp_options_association" "vpc_dhcp_options_association" {
  dhcp_options_id = var.vpc_dhcp_options_association_dhcp_options_id
  vpc_id          = var.vpc_dhcp_options_association_vpc_id
}
