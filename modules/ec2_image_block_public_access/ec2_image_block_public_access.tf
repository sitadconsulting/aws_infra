resource "aws_ec2_image_block_public_access" "ec2_image_block_public_access" {
  state = var.ec2_image_block_public_access_state
}
