variable "sns_topic_subscription_confirmation_timeout_in_minutes" {
  description = "Integer indicating number of minutes to wait in retrying mode for fetching subscription arn before marking it as failure. Only applicable for http and https protocols. Default is 1"
  type        = number
  default     = 1
}
variable "sns_topic_subscription_delivery_policy" {
  description = "JSON String with the delivery policy (retries, backoff, etc.) that will be used in the subscription - this only applies to HTTP/S subscriptions"
  type        = string
  default     = ""
}
variable "sns_topic_subscription_endpoint" {
  description = "Endpoint to send data to. The contents vary with the protocol"
  type        = string
}
variable "sns_topic_subscription_endpoint_auto_confirms" {
  description = "Whether the endpoint is capable of auto confirming subscription (e.g., PagerDuty). Default is false"
  type        = bool
  default     = false
}
variable "sns_topic_subscription_filter_policy" {
  description = "JSON String with the filter policy that will be used in the subscription to filter messages seen by the target resource"
  type        = string
  default     = ""
}
variable "sns_topic_subscription_filter_policy_scope" {
  description = "Whether the filter_policy applies to MessageAttributes (default) or MessageBody "
  type        = string
  default     = ""
}
variable "sns_topic_subscription_protocol" {
  description = "Protocol to use. Valid values are: sqs, sms, lambda, firehose, and application. Protocols email, email-json, http and https are also valid but partially supported"
  type        = string
}
variable "sns_topic_subscription_raw_message_delivery" {
  description = "Whether to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property). Default is false "
  type        = bool
  default     = false
}
variable "sns_topic_subscription_redrive_policy" {
  description = "JSON String with the redrive policy that will be used in the subscription"
  type        = string
  default     = ""
}
variable "sns_topic_subscription_subscription_role_arn" {
  description = "ARN of the IAM role to publish to Kinesis Data Firehose delivery stream"
  type        = string
  default     = ""
}
variable "sns_topic_subscription_topic_arn" {
  description = "ARN of the SNS topic to subscribe to"
  type        = string
  default     = ""
}
