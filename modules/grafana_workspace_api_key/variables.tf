variable "grafana_workspace_api_key_key_name" {
  description = "Specifies the name of the API key. Key names must be unique to the workspace"
  type        = string
}
variable "grafana_workspace_api_key_key_role" {
  description = "Specifies the permission level of the API key. Valid values are VIEWER, EDITOR, or ADMIN"
  type        = string
}
variable "grafana_workspace_api_key_seconds_to_live" {
  description = "Specifies the time in seconds until the API key expires. Keys can be valid for up to 30 days"
  type        = string
}
variable "grafana_workspace_api_key_workspace_id" {
  description = "The ID of the workspace that the API key is valid for"
  type        = string
}
