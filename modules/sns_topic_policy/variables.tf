variable "sns_topic_policy_arn" {
  description = "The ARN of the SNS topic"
  type        = string
}
variable "sns_topic_policy_policy" {
  description = "The fully-formed AWS policy as JSON"
  type        = string
}
