resource "aws_ec2_instance_metadata_defaults" "ec2_instance_metadata_defaults" {
  http_endpoint               = var.ec2_instance_metadata_defaults_http_endpoint
  http_tokens                 = var.ec2_instance_metadata_defaults_http_tokens
  http_put_response_hop_limit = var.ec2_instance_metadata_defaults_http_put_response_hop_limit
  instance_metadata_tags      = var.ec2_instance_metadata_defaults_instance_metadata_tags
}
