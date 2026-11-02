variable "networkflowmonitor_monitor_monitor_name" {
  description = "(Required) The name of the monitor. Cannot be changed after creation"
  type        = string
}
variable "networkflowmonitor_monitor_scope_arn" {
  description = "(Required) ARN of the scope for the monitor. Cannot be changed after creation"
  type        = string
}
variable "networkflowmonitor_monitor_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "networkflowmonitor_monitor_local_resource" {
  description = "(Optional) The local resources to monitor. A local resource in a workload is the location of the hosts where the Network Flow Monitor agent is installed"
  type        = list(object({
    type       = string
    identifier = string
  }))
  default     = []
}
variable "networkflowmonitor_monitor_remote_resource" {
  description = "(Optional) The remote resources to monitor. A remote resource is the other endpoint specified for the network flow of a workload, with a local resource"
  type        = list(object({
    type       = string
    identifier = string
  }))
  default     = []
}
