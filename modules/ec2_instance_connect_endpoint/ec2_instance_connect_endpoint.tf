resource "aws_ec2_instance_connect_endpoint" "ec2_instance_connect_endpoint" {
  ip_address_type    = var.ec2_instance_connect_endpoint_ip_address_type
  preserve_client_ip = var.ec2_instance_connect_endpoint_preserve_client_ip
  security_group_ids = var.ec2_instance_connect_endpoint_security_group_ids
  subnet_id          = var.ec2_instance_connect_endpoint_subnet_id
  tags               = var.ec2_instance_connect_endpoint_tags
}
