variable "ce_anomaly_monitor_monitor_dimension" {
  description = "(Required, if monitor_type is DIMENSIONAL) The dimensions to evaluate. Valid values: COST_CATEGORY, LINKED_ACCOUNT, SERVICE, TAG"
  type        = string
}
variable "ce_anomaly_monitor_monitor_specification" {
  description = "(Required, if monitor_type is CUSTOM) A valid JSON representation for the Expression object"
  type        = string
}
variable "ce_anomaly_monitor_monitor_type" {
  description = "(Required) The possible type values. Valid values: DIMENSIONAL | CUSTOM"
  type        = string
}
variable "ce_anomaly_monitor_name" {
  description = "(Required) The name of the monitor"
  type        = string
}
variable "ce_anomaly_monitor_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
