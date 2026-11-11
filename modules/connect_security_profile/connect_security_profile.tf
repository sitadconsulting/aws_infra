resource "aws_connect_security_profile" "connect_security_profile" {
  description = var.connect_security_profile_description
  instance_id = var.connect_security_profile_instance_id
  name        = var.connect_security_profile_name
  permissions = var.connect_security_profile_permissions
  tags        = var.connect_security_profile_tags
}
