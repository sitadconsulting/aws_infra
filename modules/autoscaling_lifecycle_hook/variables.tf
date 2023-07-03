variable "autoscaling_lifecycle_hook_autoscaling_group_name" {
  description = "Name of the Auto Scaling group to which you want to assign the lifecycle hook"
  type        = string
}
variable "autoscaling_lifecycle_hook_default_result" {
  description = "Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The value for this parameter can be either CONTINUE or ABANDON. The default value for this parameter is ABANDON"
  type        = string
  default     = "ABANDON"
}
variable "autoscaling_lifecycle_hook_heartbeat_timeout" {
  description = "Defines the amount of time, in seconds, that can elapse before the lifecycle hook times out. When the lifecycle hook times out, Auto Scaling performs the action defined in the DefaultResult parameter"
  type        = number
  default     = null
}
variable "autoscaling_lifecycle_hook_lifecycle_transition" {
  description = "Instance state to which you want to attach the lifecycle hook"
  type        = string
}
variable "autoscaling_lifecycle_hook_name" {
  description = "Name of the lifecycle hook"
  type        = string
}
variable "autoscaling_lifecycle_hook_notification_metadata" {
  description = "Contains additional information that you want to include any time Auto Scaling sends a message to the notification target"
  type        = string
  default     = ""
}
variable "autoscaling_lifecycle_hook_notification_target_arn" {
  description = "ARN of the notification target that Auto Scaling will use to notify you when an instance is in the transition state for the lifecycle hook. This ARN target can be either an SQS queue or an SNS topic"
  type        = string
  default     = ""
}
variable "autoscaling_lifecycle_hook_role_arn" {
  description = "ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target"
  type        = string
  default     = ""
}
