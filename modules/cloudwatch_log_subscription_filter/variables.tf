variable "cloudwatch_log_subscription_filter_destination_arn" {
  description = "The ARN of the destination to deliver matching log events to. Kinesis stream or Lambda function ARN"
  type        = string
}
variable "cloudwatch_log_subscription_filter_distribution" {
  description = "The method used to distribute log data to the destination. By default log data is grouped by log stream, but the grouping can be set to random for a more even distribution. This property is only applicable when the destination is an Amazon Kinesis stream. Valid values are \"Random\" and \"ByLogStream\""
  type        = string
  default     = ""
}
variable "cloudwatch_log_subscription_filter_filter_pattern" {
  description = "A valid CloudWatch Logs filter pattern for subscribing to a filtered stream of log events. Use empty string \"\" to match everything"
  type        = string
}
variable "cloudwatch_log_subscription_filter_log_group_name" {
  description = "The name of the log group to associate the subscription filter with"
  type        = string
}
variable "cloudwatch_log_subscription_filter_name" {
  description = "A name for the subscription filter"
  type        = string
}
variable "cloudwatch_log_subscription_filter_role_arn" {
  description = "The ARN of an IAM role that grants Amazon CloudWatch Logs permissions to deliver ingested log events to the destination. If you use Lambda as a destination, you should skip this argument and use aws_lambda_permission resource for granting access from CloudWatch logs to the destination Lambda function"
  type        = string
  default     = ""
}
