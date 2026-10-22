resource "aws_ec2_capacity_reservation" "ec2_capacity_reservation" {
  availability_zone       = var.ec2_capacity_reservation_availability_zone
  ebs_optimized           = var.ec2_capacity_reservation_ebs_optimized
  end_date                = var.ec2_capacity_reservation_end_date
  end_date_type           = var.ec2_capacity_reservation_end_date_type
  ephemeral_storage       = var.ec2_capacity_reservation_ephemeral_storage
  instance_count          = var.ec2_capacity_reservation_instance_count
  instance_match_criteria = var.ec2_capacity_reservation_instance_match_criteria
  instance_platform       = var.ec2_capacity_reservation_instance_platform
  instance_type           = var.ec2_capacity_reservation_instance_type
  outpost_arn             = var.ec2_capacity_reservation_outpost_arn
  placement_group_arn     = var.ec2_capacity_reservation_placement_group_arn
  tags                    = var.ec2_capacity_reservation_tags
  tenancy                 = var.ec2_capacity_reservation_tenancy
}
