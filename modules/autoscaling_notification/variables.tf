variable "autoscaling_notification_group_names" {
  description = "(Required) List of Auto Scaling group Names"
  type        = list(string)
}
variable "autoscaling_notification_notifications" {
  description = "(Required) List of Notification Types that trigger notifications"
  type        = list(string)
}
variable "autoscaling_notification_topic_arn" {
  description = "(Required) Topic ARN for notifications to be sent through"
  type        = string
}
