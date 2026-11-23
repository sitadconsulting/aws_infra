variable "iot_logging_options_default_log_level" {
  description = "(Optional) The default logging level. Valid Values: \"DEBUG\", \"INFO\", \"ERROR\", \"WARN\", \"DISABLED\""
  type        = string
  default     = null
}
variable "iot_logging_options_disable_all_logs" {
  description = "(Optional) If true all logs are disabled. The default is false"
  type        = bool
  default     = false
}
variable "iot_logging_options_role_arn" {
  description = "(Required) The ARN of the role that allows IoT to write to CloudWatch logs"
  type        = string
}
