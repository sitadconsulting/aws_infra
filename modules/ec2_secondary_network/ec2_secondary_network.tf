resource "aws_ec2_secondary_network" "ec2_secondary_network" {
  ipv4_cidr_block = var.ec2_secondary_network_ipv4_cidr_block
  network_type    = var.ec2_secondary_network_network_type
  tags            = var.ec2_secondary_network_tags
}
