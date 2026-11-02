variable "cloudwatch_log_resource_policy_policy_document" {
  description = "(Required) Details of the resource policy, including the identity of the principal that is enabled to put logs to this account. This is formatted as a JSON string. Maximum length of 5120 characters"
  type        = string
}
variable "cloudwatch_log_resource_policy_policy_name" {
  description = "(Required) Name of the resource policy"
  type        = string
}
variable "cloudwatch_log_resource_policy_resource_arn" {
  description = "(Optional) ARN of the CloudWatch Logs resource to which the resource policy is attached. Exactly one of policy_name or resource_arn must be specified and this argument is required for resource-scoped policies. Only one policy can be attached per log group resource ARN"
  type        = string
  default     = null
}
