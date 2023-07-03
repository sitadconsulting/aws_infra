variable "redshift_event_subscription_enabled" {
  description = "A boolean flag to enable/disable the subscription. Defaults to true"
  type        = bool
  default     = false
}
variable "redshift_event_subscription_event_categories" {
  description = "A list of event categories for a SourceType that you want to subscribe to. To see the categories run aws redshift describe-event-categories"
  type        = list(string)
  default     = []
}
variable "redshift_event_subscription_name" {
  description = "The name of the Redshift event subscription"
  type        = string
}
variable "redshift_event_subscription_severity" {
  description = "The event severity to be published by the notification subscription. Valid options are INFO or ERROR. Default value of INFO"
  type        = string
  default     = "INFO"
}
variable "redshift_event_subscription_sns_topic_arn" {
  description = "The ARN of the SNS topic to send events to"
  type        = string
}
variable "redshift_event_subscription_source_ids" {
  description = "A list of identifiers of the event sources for which events will be returned. If not specified, then all sources are included in the response. If specified, a source_type must also be specified"
  type        = list(string)
  default     = ""
}
variable "redshift_event_subscription_source_type" {
  description = "The type of source that will be generating the events. Valid options are cluster, cluster-parameter-group, cluster-security-group, cluster-snapshot, or scheduled-action. If not set, all sources will be subscribed to"
  type        = string
  default     = ""
}
variable "redshift_event_subscription_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
