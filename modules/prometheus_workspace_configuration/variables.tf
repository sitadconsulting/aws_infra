variable "prometheus_workspace_configuration_retention_period_in_days" {
  description = "(Optional) Number of days to retain metric data in the workspace"
  type        = number
  default     = null
}
variable "prometheus_workspace_configuration_workspace_id" {
  description = "(Required) ID of the workspace to configure"
  type        = string
}
variable "prometheus_workspace_configuration_limits_per_label_set" {
  description = "(Optional) Configuration block for setting limits on metrics with specific label sets"
  type        = list(object({
    label_set  = map(string)
    limits     = list(object({
      max_series = number
    }))
  }))
}
