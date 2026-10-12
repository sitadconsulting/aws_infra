variable "prometheus_alert_manager_definition_definition" {
  description = " Required) the alert manager definition that you want to be applied"
  type        = string
}
variable "prometheus_alert_manager_definition_workspace_id" {
  description = "(Required) ID of the prometheus workspace the alert manager definition should be linked to"
  type        = string
}
