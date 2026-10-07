variable "grafana_role_association_group_ids" {
  description = "The AWS SSO group ids to be assigned the role given in role"
  type        = list(string)
  default     = []
}
variable "grafana_role_association_role" {
  description = "The grafana role. Valid Values: ADMIN, EDITOR and VIEWER"
  type        = string
}
variable "grafana_role_association_user_ids" {
  description ="The AWS SSO user ids to be assigned the role given in role"
  type        = list(string)
  default     = []
}
variable "grafana_role_association_workspace_id" {
  description = "The workspace id"
  type        = string
}
