resource "aws_datazone_user_profile" "datazone_user_profile" {
  domain_identifier = var.datazone_user_profile_domain_identifier
  user_identifier   = var.datazone_user_profile_user_identifier
  user_type         = var.datazone_user_profile_user_type
  status            = var.datazone_user_profile_status
}
