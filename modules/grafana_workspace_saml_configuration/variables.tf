variable "grafana_workspace_saml_configuration_admin_role_values" {
  description = "The admin role values"
  type        = list(string)
  default     = []
}
variable "grafana_workspace_saml_configuration_allowed_organizations" {
  description = "The allowed organizations"
  type        = list(string)
  default     = []
}
variable "grafana_workspace_saml_configuration_editor_role_values" {
  description = "The editor role values"
  type        = list(string)
}
variable "grafana_workspace_saml_configuration_email_assertion" {
  description = " The email assertion"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_groups_assertion" {
  description = "The groups assertion"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_idp_metadata_url" {
  description = "The IDP Metadata URL. Note that either idp_metadata_url or idp_metadata_xml (but not both) must be specified"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_idp_metadata_xml" {
  description = "The IDP Metadata XML. Note that either idp_metadata_url or idp_metadata_xml (but not both) must be specified"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_login_assertion" {
  description = "The login assertion"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_login_validity_duration" {
  description = "The login validity duration"
  type        = number
  default     = null
}
variable "grafana_workspace_saml_configuration_name_assertion" {
  description = "The name assertion"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_org_assertion" {
  description = "The org assertio "
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_role_assertion" {
  description = "The role assertion"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_workspace_id" {
  description = "The workspace id"
  type        = string
}
