resource "aws_ec2_instance_state" "ec2_instance_state" {
  force       = var.ec2_instance_state_force
  instance_id = var.ec2_instance_state_instance_id
  state       = var.ec2_instance_state_state
}
