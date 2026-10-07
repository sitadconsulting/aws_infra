variable "grafana_license_association_grafana_token" {
  description = "(Optional) A token from Grafana Labs that ties your AWS account with a Grafana Labs account"
  type        = string
  default     = null
}
variable "grafana_license_association_license_type" {
  description = "The type of license for the workspace license association. Valid values are ENTERPRISE and ENTERPRISE_FREE_TRIAL"
  type        = string
  default     = "ENTERPRISE_FREE_TRIAL"
}
variable "grafana_license_association_workspace_id" {
  description = "The workspace id "
  type        = string
}
