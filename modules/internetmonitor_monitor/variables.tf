variable "internetmonitor_monitor_max_city_networks_to_monitor" {
  description = "(Optional) The maximum number of city-networks to monitor for your resources. A city-network is the location (city) where clients access your application resources from and the network or ASN, such as an internet service provider (ISP), that clients access the resources through. This limit helps control billing costs"
  type        = number
  default     = null
}
variable "internetmonitor_monitor_monitor_name" {
  description = "(Required) The name of the monitor"
  type        = string
}
variable "internetmonitor_monitor_resources" {
  description = "(Optional) Resources to include in a monitor, which you provide as a set of ARNs"
  type        = list(string)
  default     = null
}
variable "internetmonitor_monitor_status" {
  description = "(Optional) The status for a monitor. The accepted values for Status with the UpdateMonitor API call are the following: ACTIVE and INACTIVE"
  type        = string
  default     = null
}
variable "internetmonitor_monitor_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "internetmonitor_monitor_traffic_percentage_to_monitor" {
  description = "(Optional) The percentage of the internet-facing traffic for your application that you want to monitor with this monitor"
  type        = number
  default     = null
}
variable "internetmonitor_monitor_health_events_config" {
  description = "(Optional) Health event thresholds. A health event threshold percentage, for performance and availability, determines when Internet Monitor creates a health event when there's an internet issue that affects your application end users"
  type        = list(object({
    availability_score_threshold = optional(number)
    performance_score_threshold  = optional(number)
  }))
  default     = []
}
variable "internetmonitor_monitor_internet_measurements_log_delivery" {
  description = "(Optional) Publish internet measurements for Internet Monitor to an Amazon S3 bucket in addition to CloudWatch Logs"
  type        = list(object({
    s3_config = optional(list(object({
      bucket_name         = string
      bucket_prefix       = optional(string)
      log_delivery_status = optional(string)
    })), [])
  }))
  default     = []
}
