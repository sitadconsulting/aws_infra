variable "autoscaling_schedule_autoscaling_group_name" {
  description = "The name of the Auto Scaling group"
  type        = string
}
variable "autoscaling_schedule_desired_capacity" {
  description = "The initial capacity of the Auto Scaling group after the scheduled action runs and the capacity it attempts to maintain. Set to -1 if you don't want to change the desired capacity at the scheduled time. Defaults to 0"
  type        = number
  default     = null
}
variable "autoscaling_schedule_end_time" {
  description = "The date and time for the recurring schedule to end, in UTC with the format \"YYYY-MM-DDThh:mm:ssZ\" (e.g. \"2021-06-01T00:00:00Z\")"
  type        = string
  default     = null
}
variable "autoscaling_schedule_max_size" {
  description = "The maximum size of the Auto Scaling group. Set to -1 if you don't want to change the maximum size at the scheduled time. Defaults to 0"
  type        = number
  default     = null
}
variable "autoscaling_schedule_min_size" {
  description = "The minimum size of the Auto Scaling group. Set to -1 if you don't want to change the minimum size at the scheduled time. Defaults to 0"
  type        = number
  default     = null
}
variable "autoscaling_schedule_recurrence" {
  description = "The recurring schedule for this action specified using the Unix cron syntax format"
  type        = string
  default     = null
}
variable "autoscaling_schedule_scheduled_action_name" {
  description = "The name of this scaling action"
  type        = string
}
variable "autoscaling_schedule_start_time" {
  description = "The date and time for the recurring schedule to start, in UTC with the format \"YYYY-MM-DDThh:mm:ssZ\" (e.g. \"2021-06-01T00:00:00Z\")"
  type        = string
  default     = null
}
variable "autoscaling_schedule_time_zone" {
  description = "Specifies the time zone for a cron expression. Valid values are the canonical names of the IANA time zones (such as Etc/GMT+9 or Pacific/Tahiti)"
  type        = string
  default     = null
}
