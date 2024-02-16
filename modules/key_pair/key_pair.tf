resource "aws_key_pair" "key_pair" {
  key_name        = var.key_pair_key_name
  key_name_prefix = var.key_pair_key_name_prefix
  public_key      = var.key_pair_public_key 
  tags =          = var.key_pair_tags
}


