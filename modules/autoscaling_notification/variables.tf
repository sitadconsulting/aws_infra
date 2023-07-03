variable "autoscaling_notification_group_names" {
  description = "List of AutoScaling Group Names"
  type        = list(string)
}
variable "autoscaling_notification_notifications" {
  description = "List of Notification Types that trigger notifications"
  type        = list(string)
}
variable "autoscaling_notification_topic_arn" {
  description = "Topic ARN for notifications to be sent through"
  type        = string
}
