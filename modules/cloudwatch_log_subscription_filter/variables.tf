variable "cloudwatch_log_subscription_filter_apply_on_transformed_logs" {
  description = "(Optional) Boolean to indicate whether to apply the subscription filter on the transformed version of the log events instead of the original ingested log events. Defaults to false. Valid only for log groups that have an active log transformer"
  type        = bool
  default     = false
}
variable "cloudwatch_log_subscription_filter_destination_arn" {
  description = "(Required) ARN of the destination to deliver matching log events to. Kinesis stream or Lambda function ARN"
  type        = string
}
variable "cloudwatch_log_subscription_filter_distribution" {
  description = "(Optional) Method used to distribute log data to the destination. By default log data is grouped by log stream, but the grouping can be set to random for a more even distribution. This property is only applicable when the destination is an Amazon Kinesis stream. Valid values are \"Random\" and \"ByLogStream\""
  type        = string
  default     = null
}
variable "cloudwatch_log_subscription_filter_emit_system_fields" {
  description = "(Optional) List of system fields to include in the log events sent to the subscription destination. These fields provide source information for centralized log data in the forwarded payload. Valid values: \"@aws.account\", \"@aws.region\", \"@source.log\". To remove this argument after it has been set, specify an empty list [] explicitly to avoid perpetual differences"
  type        = list(string)
  default     = null
}
variable "cloudwatch_log_subscription_filter_filter_pattern" {
  description = "(Required) valid CloudWatch Logs filter pattern for subscribing to a filtered stream of log events. Use empty string \"\" to match everything"
  type        = string
}
variable "cloudwatch_log_subscription_filter_log_group_name" {
  description = "(Required) Name of the log group to associate the subscription filter with"
  type        = string
}
variable "cloudwatch_log_subscription_filter_name" {
  description = "(Required) name for the subscription filter"
  type        = string
}
variable "cloudwatch_log_subscription_filter_role_arn" {
  description = "(Optional) ARN of an IAM role that grants CloudWatch Logs permissions to deliver ingested log events to the destination stream. You don't need to provide the ARN when you are working with a logical destination for cross-account delivery. If you use Lambda as a destination, you should skip this argument and use aws_lambda_permission resource for granting access from CloudWatch logs to the destination Lambda function"
  type        = string
  default     = null
}
