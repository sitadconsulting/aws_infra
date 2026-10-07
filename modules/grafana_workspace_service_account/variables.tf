variable "grafana_workspace_service_account_grafana_role" {
  description = "(Required) The permission level to use for this service account. For more information about the roles and the permissions each has"
  type        = string
}
variable "grafana_workspace_service_account_name" {
  description = "(Required) A name for the service account. The name must be unique within the workspace, as it determines the ID associated with the service account"
  type        = string
}
variable "grafana_workspace_service_account_workspace_id" {
  description = "(Required) The Grafana workspace with which the service account is associated"
  type        = string
}
