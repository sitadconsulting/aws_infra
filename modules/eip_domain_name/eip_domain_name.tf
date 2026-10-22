resource "aws_eip_domain_name" "eip_domain_name" {
  allocation_id = var.eip_domain_name_allocation_id
  domain_name   = var.eip_domain_name_domain_name
}
