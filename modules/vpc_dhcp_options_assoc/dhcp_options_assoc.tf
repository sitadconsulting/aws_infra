
###############################
# DHCP Options Set Association
###############################

resource "aws_vpc_dhcp_options_association" "dhcp_options_association" {

  vpc_id          = var.dhcp_options_association_vpc_id
  dhcp_options_id = var.dhcp_options_association_dhcp_options_id

}
