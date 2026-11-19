variable "cloudwatch_event_archive_description" {
  description = "(Optional) Description for the archive"
  type        = string
  default     = null
}
variable "cloudwatch_event_archive_event_pattern" {
  description = "(Optional) Event pattern to use to filter events sent to the archive. By default, it attempts to archive every event received in the event_source_arn"
  type        = string
  default     = null
}
variable "cloudwatch_event_archive_event_source_arn" {
  description = "(Required) ARN of the event bus associated with the archive. Only events from this event bus are sent to the archive"
  type        = string
}
variable "cloudwatch_event_archive_kms_key_identifier" {
  description = "(Optional) Identifier of the AWS KMS customer managed key for EventBridge to use, if you choose to use a customer managed key to encrypt this archive. The identifier can be the key ARN, KeyId, key alias, or key alias ARN"
  type        = string
  default     = null
}
variable "cloudwatch_event_archive_name" {
  description = "(Required) Name of the archive. The archive name cannot exceed 48 characters"
  type        = string
}
variable "cloudwatch_event_archive_retention_days" {
  description = "(Optional) The maximum number of days to retain events in the new event archive. By default, it archives indefinitely"
  type        = number
  default     = null
}
