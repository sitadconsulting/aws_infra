resource "aws_ami_copy" "ami_copy" {
  destination_outpost_arn = var.ami_copy_destination_outpost_arn
  encrypted               = var.ami_copy_encrypted
  kms_key_id              = var.ami_copy_kms_key_id
  name                    = var.ami_copy_name
  source_ami_id           = var.ami_copy_source_ami_id
  source_ami_region       = var.ami_copy_source_ami_region
  tags                    = var.ami_copy_tags
}
