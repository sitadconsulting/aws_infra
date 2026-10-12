resource "awscc_qbusiness_application" "qbusiness_application" {
  client_ids_for_oidc             = var.qbusiness_application_client_ids_for_oidc
  description                     = var.qbusiness_application_description
  display_name                    = var.qbusiness_application_display_name
  iam_identity_provider_arn       = var.qbusiness_application_iam_identity_provider_arn
  identity_center_instance_arn    = var.qbusiness_application_identity_center_instance_arn
  identity_type                   = var.qbusiness_application_identity_type
  role_arn                        = var.qbusiness_application_role_arn
  tags                            = var.qbusiness_application_tags
  attachments_configuration       = var.qbusiness_application_attachments_configuration
  auto_subscription_configuration = var.qbusiness_application_auto_subscription_configuration
  encryption_configuration        = var.qbusiness_application_encryption_configuration
  personalization_configuration   = var.qbusiness_application_personalization_configuration
  q_apps_configuration            = var.qbusiness_application_q_apps_configuration
  quick_sight_configuration       = var.qbusiness_application_quick_sight_configuration
}
