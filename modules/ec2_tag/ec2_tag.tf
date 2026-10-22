resource "aws_ec2_tag" "ec2_tag" {
  key         = var.ec2_tag_key
  resource_id = var.ec2_tag_resource_id
  value       = var.ec2_tag_value
}
