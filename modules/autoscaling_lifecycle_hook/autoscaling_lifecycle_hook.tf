resource "aws_autoscaling_lifecycle_hook" "autoscaling_lifecycle_hook" {
  autoscaling_group_name  = var.autoscaling_lifecycle_hook_autoscaling_group_name
  default_result          = var.autoscaling_lifecycle_hook_default_result
  heartbeat_timeout       = var.autoscaling_lifecycle_hook_heartbeat_timeout
  lifecycle_transition    = var.autoscaling_lifecycle_hook_lifecycle_transition
  name                    = var.autoscaling_lifecycle_hook_name
  notification_metadata   = var.autoscaling_lifecycle_hook_notification_metadata
  notification_target_arn = var.autoscaling_lifecycle_hook_notification_target_arn
  role_arn                = var.autoscaling_lifecycle_hook_role_arn
}
