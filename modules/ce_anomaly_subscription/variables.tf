variable "ce_anomaly_subscription_account_id" {
  description = "(Optional) The unique identifier for the AWS account in which the anomaly subscription ought to be created"
  type        = string
  default     = null
}
variable "ce_anomaly_subscription_frequency" {
  description = "(Required) The frequency that anomaly reports are sent. Valid Values: DAILY | IMMEDIATE | WEEKLY"
  type        = string
}
variable "ce_anomaly_subscription_monitor_arn_list" {
  description = "(Required) A list of cost anomaly monitors"
  type        = list(string)
}
variable "ce_anomaly_subscription_name" {
  description = "(Required) The name for the subscription"
  type        = string
}
variable "ce_anomaly_subscription_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "ce_anomaly_subscription_subscriber" {
  description = "(Required) A subscriber configuration. Multiple subscribers can be defined"
  type        = list(object({
    type    = string
    address = string
  }))
}
variable "ce_anomaly_subscription_threshold_expression" {
  description = "(Optional) An Expression object used to specify the anomalies that you want to generate alerts for"
  type        = list(object({
    and           = optional(string)
    not           = optional(string)
    or            = optional(string)
    cost_category = optional(list(object({
      key           = optional(string)
      match_options = optional(string)
      values        = optional(string)
    })), [])
    dimension     = optional(list(object({
      key           = optional(string)
      match_options = optional(string)
      values        = optional(string)
    })), [])
    tags          = optional(list(object({
      key           = optional(string)
      match_options = optional(string)
      values        = optional(string)
    })), [])
  }))
  default     = []
}
