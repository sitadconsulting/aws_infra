variable "grafana_workspace_service_account_grafana_role" {
  description = "(Required) Permission level to use for this service account"
  type        = string
}
variable "grafana_workspace_service_account_name" {
  description = "(Required) Name for the service account. The name must be unique within the workspace, as it determines the ID associated with the service account"
  type        = string
}
variable "grafana_workspace_service_account_workspace_id" {
  description = "(Required) Grafana workspace with which the service account is associated"
  type        = string
}
