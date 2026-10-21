resource "aws_ec2_availability_zone_group" "ec2_availability_zone_group" {
  group_name    = var.ec2_availability_zone_group_group_name
  opt_in_status = var.ec2_availability_zone_group_opt_in_status
}
