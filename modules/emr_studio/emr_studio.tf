resource "aws_emr_studio" "emr_studio" {
  auth_mode                      = var.emr_studio_auth_mode
  default_s3_location            = var.emr_studio_default_s3_location
  description                    = var.emr_studio_description
  encryption_key_arn             = var.emr_studio_encryption_key_arn
  engine_security_group_id       = var.emr_studio_engine_security_group_id
  idp_auth_url                   = var.emr_studio_idp_auth_url
  idp_relay_state_parameter_name = var.emr_studio_idp_relay_state_parameter_name
  name                           = var.emr_studio_name
  service_role                   = var.emr_studio_service_role
  subnet_ids                     = var.emr_studio_subnet_ids
  tags                           = var.emr_studio_tags
  user_role                      = var.emr_studio_user_role
  vpc_id                         = var.emr_studio_vpc_id
  workspace_security_group_id    = var.emr_studio_workspace_security_group_id
}
