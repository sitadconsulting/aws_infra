variable "dms_event_subscription_enabled" {
  description = "(Optional, Default: true) Whether the event subscription should be enabled"
  type        = bool
  default     = null
}
variable "dms_event_subscription_event_categories" {
  description = "(Optional) List of event categories to listen for, see DescribeEventCategories for a canonical list"
  type        = list(string)
  default     = null
}
variable "dms_event_subscription_name" {
  description = "(Required) Name of event subscription"
  type        = string
}
variable "dms_event_subscription_sns_topic_arn" {
  description = "(Required) SNS topic ARN to send events on"
  type        = string
}
variable "dms_event_subscription_source_ids" {
  description = "(Optional) IDs of sources to listen to. If you don't specify a value, notifications are provided for all sources"
  type        = list(string)
  default     = null
}
variable "dms_event_subscription_source_type" {
  description = "(Required) Type of source for events. Valid values: replication-instance or replication-task"
  type        = string
}
variable "dms_event_subscription_tags" {
  description = "(Optional) Map of resource tags to assign to the resource"
  type        = map(string)
  default     = {}
}
