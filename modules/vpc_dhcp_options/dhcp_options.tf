resource "aws_vpc_dhcp_options" "vpc_dhcp_options" {
  domain_name          = var.vpc_dhcp_options_domain_name
  domain_name_servers  = var.vpc_dhcp_options_domain_name_servers
  netbios_name_servers = var.vpc_dhcp_options_netbios_name_servers
  netbios_node_type    = var.vpc_dhcp_options_netbios_node_type
  ntp_servers          = var.vpc_dhcp_options_ntp_servers
  tags                 = var.vpc_dhcp_options_tags
}
