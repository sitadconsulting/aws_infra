variable "sqs_queue_content_based_deduplication" {
  description = "Enables content-based deduplication for FIFO queues"
  type        = bool
  default     = false
}
variable "sqs_queue_deduplication_scope" {
  description = "Specifies whether message deduplication occurs at the message group or queue level. Valid values are messageGroup and queue (default)"
  type        = string
  default     = ""
}
variable "sqs_queue_delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 seconds"
  type        = number
  default     = null
}
variable "sqs_queue_fifo_queue" {
  description = "Whether to create a FIFO queue. Default false, if false standard queue is created"
  type        = bool
  default     = false
}
variable "sqs_queue_fifo_throughput_limit" {
  description = "Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are perQueue (default) and perMessageGroupId"
  type        = string
  default     = ""
}
variable "sqs_queue_kms_data_key_reuse_period_seconds" {
  description = "The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). The default is 300 (5 minutes)"
  type        = number
  default     = null
}
variable "sqs_queue_kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK"
  type        = string
  default     = ""
}
variable "sqs_queue_max_message_size" {
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB)"
  type        = number
  default     = null
}
variable "sqs_queue_message_retention_seconds" {
  description = " The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days). The default for this attribute is 345600 (4 days)"
  type        = number
  default     = null
}
variable "sqs_queue_name" {
  description = "The name of the queue"
  type        = string
  default     = ""
}
variable "sqs_queue_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = ""
}
variable "sqs_queue_policy" {
  description = "The JSON policy for the SQS queue"
  type        = string
  default     = ""
}
variable "sqs_queue_receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds). The default for this attribute is 0, meaning that the call will return immediately"
  type        = number
  default     = null
}
variable "sqs_queue_redrive_allow_policy" {
  description = "The JSON policy to set up the Dead Letter Queue redrive permission"
  type        = string
  default     = ""
}
variable "sqs_queue_redrive_policy" {
  description = "The JSON policy to set up the Dead Letter Queue, see AWS docs. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string ("5")"
  type        = string
  default     = ""
}
variable "sqs_queue_sqs_managed_sse_enabled" {
  description = "Whether to enable server-side encryption (SSE) of message content with SQS-owned encryption keys"
  type        = bool
  default     = false
}
variable "sqs_queue_tags" {
  description = "A map of tags to assign to the queue"
  type        = map(string)
  default     = {}
}
variable "sqs_queue_visibility_timeout_seconds" {
  description = "The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). The default for this attribute is 30"
  type        = number
  default     = null
}
