variable "grafana_workspace_saml_configuration_admin_role_values" {
  description = "(Optional) Admin role values"
  type        = list(string)
  default     = null
}
variable "grafana_workspace_saml_configuration_allowed_organizations" {
  description = "(Optional) Allowed organizations"
  type        = list(string)
  default     = null
}
variable "grafana_workspace_saml_configuration_editor_role_values" {
  description = "(Required) Editor role values"
  type        = list(string)
}
variable "grafana_workspace_saml_configuration_email_assertion" {
  description = "(Optional) Email assertion"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_groups_assertion" {
  description = "(Optional) Groups assertion"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_idp_metadata_url" {
  description = "(Optional) IDP Metadata URL. Note that either idp_metadata_url or idp_metadata_xml (but not both) must be specified"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_idp_metadata_xml" {
  description = "(Optional) IDP Metadata XML. Note that either idp_metadata_url or idp_metadata_xml (but not both) must be specified"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_login_assertion" {
  description = "(Optional) Login assertion"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_login_validity_duration" {
  description = "(Optional) Login validity duration"
  type        = number
  default     = null
}
variable "grafana_workspace_saml_configuration_name_assertion" {
  description = "(Optional) Name assertion"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_org_assertion" {
  description = "(Optional) Org assertion"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_role_assertion" {
  description = "(Optional) Role assertion"
  type        = string
  default     = null
}
variable "grafana_workspace_saml_configuration_workspace_id" {
  description = "(Required) Workspace ID"
  type        = string
}
