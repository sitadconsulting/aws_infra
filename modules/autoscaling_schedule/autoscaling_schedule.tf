resource "aws_autoscaling_schedule" "autoscaling_schedule" {
  autoscaling_group_name = var.autoscaling_schedule_autoscaling_group_name
  desired_capacity       = var.autoscaling_schedule_desired_capacity
  end_time               = var.autoscaling_schedule_end_time
  max_size               = var.autoscaling_schedule_max_size
  min_size               = var.autoscaling_schedule_min_size
  recurrence             = var.autoscaling_schedule_recurrence
  scheduled_action_name  = var.autoscaling_schedule_scheduled_action_name
  start_time             = var.autoscaling_schedule_start_time
  time_zone              = var.autoscaling_schedule_time_zone
}
