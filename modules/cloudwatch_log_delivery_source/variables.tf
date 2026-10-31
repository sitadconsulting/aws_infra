variable "cloudwatch_log_delivery_source_log_type" {
  description = "(Required) The type of log that the source is sending. For Amazon Bedrock, the valid value is APPLICATION_LOGS. For Amazon Bedrock AgentCore, the valid values are APPLICATION_LOGS, TRACES, and USAGE_LOGS. For Amazon CloudFront, the valid value is ACCESS_LOGS. For Amazon CodeWhisperer, the valid value is EVENT_LOGS. For IAM Identity Center, the valid value is ERROR_LOGS. For Amazon WorkMail, the valid values are ACCESS_CONTROL_LOGS, AUTHENTICATION_LOGS, WORKMAIL_AVAILABILITY_PROVIDER_LOGS, and WORKMAIL_MAILBOX_ACCESS_LOGS"
  type        =  string
} 
variable "cloudwatch_log_delivery_source_name" {
  description = "(Required) The name for this delivery source"
  type        = string
}
variable "cloudwatch_log_delivery_source_resource_arn" {
  description = "(Required) The ARN of the AWS resource that is generating and sending logs"
  type        = string
}
variable "cloudwatch_log_delivery_source_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
