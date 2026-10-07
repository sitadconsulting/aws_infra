resource "aws_grafana_workspace_saml_configuration" "grafana_workspace_saml_configuration" {
  admin_role_values       = var.grafana_workspace_saml_configuration_admin_role_values
  allowed_organizations   = var.grafana_workspace_saml_configuration_allowed_organizations
  editor_role_values      = var.grafana_workspace_saml_configuration_editor_role_values
  email_assertion         = var.grafana_workspace_saml_configuration_email_assertion
  groups_assertion        = var.grafana_workspace_saml_configuration_groups_assertion
  idp_metadata_url        = var.grafana_workspace_saml_configuration_idp_metadata_url
  idp_metadata_xml        = var.grafana_workspace_saml_configuration_idp_metadata_xml
  login_assertion         = var.grafana_workspace_saml_configuration_login_assertion
  login_validity_duration = var.grafana_workspace_saml_configuration_login_validity_duration
  name_assertion          = var.grafana_workspace_saml_configuration_name_assertion
  org_assertion           = var.grafana_workspace_saml_configuration_org_assertion
  role_assertion          = var.grafana_workspace_saml_configuration_role_assertion
  workspace_id            = var.grafana_workspace_saml_configuration_workspace_id
}
