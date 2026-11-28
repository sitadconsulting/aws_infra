variable "grafana_role_association_group_ids" {
  description = "(Optional) AWS SSO group IDs to be assigned the role given in role"
  type        = list(string)
  default     = null
}
variable "grafana_role_association_role" {
  description = "(Required) Grafana role. Valid Values: ADMIN, EDITOR and VIEWER"
  type        = string
}
variable "grafana_role_association_user_ids" {
  description ="(Optional) AWS SSO user IDs to be assigned the role given in role"
  type        = list(string)
  default     = null
}
variable "grafana_role_association_workspace_id" {
  description = "(Required) Workspace ID"
  type        = string
}
