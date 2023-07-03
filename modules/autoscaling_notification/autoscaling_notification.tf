resource "aws_autoscaling_notification" "autoscaling_notification" {
  group_names   = var.autoscaling_notification_group_names
  notifications = var.autoscaling_notification_notifications
  topic_arn     = var.autoscaling_notification_topic_arn
}

