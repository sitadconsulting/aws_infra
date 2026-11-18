resource "aws_emr_studio_session_mapping" "emr_studio_session_mapping" {
  identity_id        = var.emr_studio_session_mapping_identity_id
  identity_name      = var.emr_studio_session_mapping_identity_name
  identity_type      = var.emr_studio_session_mapping_identity_type
  session_policy_arn = var.emr_studio_session_mapping_session_policy_arn
  studio_id          = var.emr_studio_session_mapping_studio_id
}
