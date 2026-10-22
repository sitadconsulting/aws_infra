resource "aws_ec2_secondary_subnet" "ec2_secondary_subnet" {
  availability_zone    = var.ec2_secondary_subnet_availability_zone
  availability_zone_id = var.ec2_secondary_subnet_availability_zone_id
  ipv4_cidr_block      = var.ec2_secondary_subnet_ipv4_cidr_block
  secondary_network_id = var.ec2_secondary_subnet_secondary_network_id
  tags                 = var.ec2_secondary_subnet_tags
}
