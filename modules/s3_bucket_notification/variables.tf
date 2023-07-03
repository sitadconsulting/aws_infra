variable "s3_bucket_notification_bucket" {
  description = "Name of the bucket for notification configuration"
  type        = string
}
variable "s3_bucket_notification_event_bridge" {
  description = "Whether to enable Amazon EventBridge notifications"
  type        = bool
  default     = false
}
variable "s3_bucket_notification_lambda_function" {
  description = "Used to configure notifications to a Lambda Function"
  type        = list(object({
    events              = list(string)
    filter_prefix       = optional(string)
    filter_suffix       = optional(string)
    id                  = optional(string)
    lambda_function_arn = string
  }))
  default     = []
}
variable "s3_bucket_notification_queue" {
  description = "Notification configuration to SQS Queue"
  type        = list(object({
    events        = list(string)
    filter_prefix = optional(string)
    filter_suffix = optional(string)
    id            = optional(string)
    queue_arn     = string
  }))
  default     = []
}
variable "s3_bucket_notification_topic" {
  description = "Notification configuration to SNS Topic"
  type        = list(object({
    events        = list(string)
    filter_prefix = optional(string)
    filter_suffix = optional(string)
    id            = optional(string)
    topic_arn     = string
  }))
  default     = []
}

