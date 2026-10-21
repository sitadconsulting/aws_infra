resource "aws_ec2_capacity_block_reservation" "ec2_capacity_block_reservation" {
  capacity_block_offering_id = var.ec2_capacity_block_reservation_capacity_block_offering_id
  instance_platform          = var.ec2_capacity_block_reservation_instance_platform
  tags                       = var.ec2_capacity_block_reservation_tags
}
