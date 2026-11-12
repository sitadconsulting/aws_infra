resource "aws_dms_instance_profile" "dms_instance_profile" {
  availability_zone       = var.dms_instance_profile_availability_zone
  description             = var.dms_instance_profile_description
  kms_key_arn             = var.dms_instance_profile_kms_key_arn
  name                    = var.dms_instance_profile_name
  network_type            = var.dms_instance_profile_network_type
  publicly_accessible     = var.dms_instance_profile_publicly_accessible
  subnet_group_identifier = var.dms_instance_profile_subnet_group_identifier
  tags                    = var.dms_instance_profile_tags
  vpc_security_group_ids  = var.dms_instance_profile_vpc_security_group_ids
}
