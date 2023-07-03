output "aautoscaling_notification_group_names" {
  description = "Auto Scaling Group notification group names"
  value       = element(concat(aws_autoscaling_notification.autoscaling_notification.*.group_names, [""]), 0)
}
output "aautoscaling_notification_notifications" {
  description = "Auto Scaling Group notification notifications"
  value       = element(concat(aws_autoscaling_notification.autoscaling_notification.*.notifications, [""]), 0)
}
output "aautoscaling_notification_topic_arn" {
  description = "Auto Scaling Group notification topic ARN"
  value       = element(concat(aws_autoscaling_notification.autoscaling_notification.*.topic_arn, [""]), 0)
}
