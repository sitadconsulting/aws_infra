variable "sns_sms_preferences_default_sender_id" {
  description = "A string, such as your business brand, that is displayed as the sender on the receiving device"
  type        = string
  default     = ""
}
variable "sns_sms_preferences_default_sms_type" {
  description = "The type of SMS message that you will send by default. Possible values are: Promotional, Transactional"
  type        = string
  default     = ""
}
variable "sns_sms_preferences_delivery_status_iam_role_arn" {
  description = "The ARN of the IAM role that allows Amazon SNS to write logs about SMS deliveries in CloudWatch Logs"
  type        = string
  default     = ""
}
variable "sns_sms_preferences_delivery_status_success_sampling_rate" {
  description = "The percentage of successful SMS deliveries for which Amazon SNS will write logs in CloudWatch Logs. The value must be between 0 and 100"
  type        = string
  default     = ""
}
variable "sns_sms_preferences_monthly_spend_limit" {
  description = "The maximum amount in USD that you are willing to spend each month to send SMS messages"
  type        = number
  default     = null
}
variable "sns_sms_preferences_usage_report_s3_bucket" {
  description = "The name of the Amazon S3 bucket to receive daily SMS usage reports from Amazon SNS"
  type        = string
  default     = ""
}
