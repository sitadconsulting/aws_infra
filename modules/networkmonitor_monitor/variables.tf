variable "networkmonitor_monitor_aggregation_period" {
  description = "(Optional) The time, in seconds, that metrics are aggregated and sent to Amazon CloudWatch. Valid values are either 30 or 60"
  type        = number
  default     = null
}
variable "networkmonitor_monitor_monitor_name" {
  description = "(Required) The name of the monitor"
  type        = string
}
variable "networkmonitor_monitor_tags" {
  description = "(Optional) Key-value tags for the monitor"
  type        = map(string)
  default     = {}
}
