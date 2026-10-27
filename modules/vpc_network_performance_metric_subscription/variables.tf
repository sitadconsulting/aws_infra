variable "vpc_network_performance_metric_subscription_destination" {
  description = "(Required) Target Region or Availability Zone that the metric subscription is enabled for. For example, eu-west-1"
  type        = string
}
variable "vpc_network_performance_metric_subscription_metric" {
  description = "(Optional) Metric used for the enabled subscription. Valid values: aggregate-latency. Default: aggregate-latency"
  type        = string
  default     = null
}
variable "vpc_network_performance_metric_subscription_source" {
  description = "(Required) Source Region or Availability Zone that the metric subscription is enabled for. For example, us-east-1"
  type        = string
}
variable "vpc_network_performance_metric_subscription_statistic" {
  description = "(Optional) Statistic used for the enabled subscription. Valid values: p50. Default: p50"
  type        = string
  default     = "p50"
}
