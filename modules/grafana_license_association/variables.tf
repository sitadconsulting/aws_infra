variable "grafana_license_association_grafana_token" {
  description = "(Optional) Token from Grafana Labs that ties your AWS account with a Grafana Labs account"
  type        = string
  default     = null
}
variable "grafana_license_association_license_type" {
  description = "(Required) Type of license for the workspace license association. Valid values are ENTERPRISE and ENTERPRISE_FREE_TRIAL"
  type        = string
}
variable "grafana_license_association_workspace_id" {
  description = "(Required) Workspace ID"
  type        = string
}
