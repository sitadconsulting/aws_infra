variable "sns_topic_application_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = ""
}
variable "sns_topic_application_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = ""
}
variable "sns_topic_application_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = number
  default     = null
}
variable "sns_topic_content_based_deduplication" {
  description = "Enables content-based deduplication for FIFO topics"
  type        = bool
  default     = false
}
variable "sns_topic_delivery_policy" {
  description = "The SNS delivery policy"
  type        = string
  default     = ""
}
variable "sns_topic_display_name" {
  description = "The display name for the topic"
  type        = string
  default     = ""
}
variable "sns_topic_fifo_topic" {
  description = "Boolean indicating whether or not to create a FIFO (first-in-first-out) topic (default is false)"
  type        = bool
  default     = false
}
variable "sns_topic_firehose_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = ""
}
variable "sns_topic_firehose_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic "
  type        = string
  default     = ""
}
variable "sns_topic_firehose_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = number
  default     = null
}
variable "sns_topic_http_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = ""
}
variable "sns_topic_http_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = ""
}
variable "sns_topic_http_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = number
  default     = null
}
variable "sns_topic_kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK"
  type        = string
  default     = ""
}
variable "sns_topic_lambda_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = ""
}
variable "sns_topic_lambda_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = ""
}
variable "sns_topic_lambda_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = number
  default     = null
}
variable "sns_topic_name" {
  description = "The name of the topic"
  type        = string
  default     = ""
}
variable "sns_topic_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = ""
}
variable "sns_topic_policy" {
  description = "The fully-formed AWS policy as JSON"
  type        = string
  default     = ""
}
variable "sns_topic_signature_version" {
  description = "If SignatureVersion should be 1 (SHA1) or 2 (SHA256)"
  type        = number
  default     = null
}
variable "sns_topic_sqs_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = "2
}
variable "sns_topic_sqs_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = ""
}
variable "sns_topic_sqs_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = number
  default     = null
}
variable "sns_topic_tracing_config" {
  description = "racing mode of an Amazon SNS topic. Valid values: "PassThrough", "Active""
  type        = string
  default     = ""
}
variable "sns_topic_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
