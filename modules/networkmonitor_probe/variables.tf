variable "networkmonitor_probe_destination" {
  description = "(Required) The destination IP address. This must be either IPV4 or IPV6"
  type        = string
}
variable "networkmonitor_probe_destination_port" {
  description = "(Optional) The port associated with the destination. This is required only if the protocol is TCP and must be a number between 1 and 65536"
  type        = number
  default     = null
}
variable "networkmonitor_probe_monitor_name" {
  description = "(Required) The name of the monitor"
  type        = string
}
variable "networkmonitor_probe_protocol" {
  description = "(Required) The protocol used for the network traffic between the source and destination. This must be either TCP or ICMP"
  type        = string
}
variable "networkmonitor_probe_source_arn" {
  description = "(Required) The ARN of the subnet"
  type        = string
}
variable "networkmonitor_probe_packet_size" {
  description = "(Optional) The size of the packets sent between the source and destination. This must be a number between 56 and 8500"
  type        = number
  default     = null
}
variable "networkmonitor_probe_tags" {
  description = "(Optional) Key-value tags for the monitor"
  type        = map(string)
  default     = {}
}
