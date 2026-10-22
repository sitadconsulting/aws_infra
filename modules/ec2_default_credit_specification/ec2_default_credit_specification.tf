resource "aws_ec2_default_credit_specification" "ec2_default_credit_specification" {
  cpu_credits     = var.ec2_default_credit_specification_cpu_credits
  instance_family = var.ec2_default_credit_specification_instance_family
}
