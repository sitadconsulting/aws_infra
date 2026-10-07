variable "grafana_workspace_service_account_token_name" {
  description = "(Required) A name for the token to create. The name must be unique within the workspace"
  type        = string
}
variable "grafana_workspace_service_account_token_seconds_to_live" {
  description = "(Required) Sets how long the token will be valid, in seconds. You can set the time up to 30 days in the future"
  type        = number
}
variable "grafana_workspace_service_account_token_service_account_id" {
  description = "(Required) The ID of the service account for which to create a token"
  type        = string
}
variable "grafana_workspace_service_account_token_workspace_id" {
  description = "(Required) The Grafana workspace with which the service account token is associated"
  type        = string
}
