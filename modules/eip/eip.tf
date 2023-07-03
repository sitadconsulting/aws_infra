resource "aws_eip" "eip" {
  address                   = var.eip_address
  associate_with_private_ip = var.eip_associate_with_private_ip
  customer_owned_ipv4_pool  = var.eip_customer_owned_ipv4_pool
  #domain                    = var.eip_domain
  instance                  = var.eip_instance
  network_border_group      = var.eip_network_border_group
  network_interface         = var.eip_network_interface
  public_ipv4_pool          = var.eip_public_ipv4_pool
  tags                      = var.eip_tags
}
