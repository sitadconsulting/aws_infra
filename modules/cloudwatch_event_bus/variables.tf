variable "cloudwatch_event_bus_description" {
  description = "(Optional) Event bus description"
  type        = string
  default     = null
}
variable "cloudwatch_event_bus_event_source_name" {
  description = "(Optional) Partner event source that the new event bus will be matched with. Must match name"
  type        = string
  default     = null
}
variable "cloudwatch_event_bus_kms_key_identifier" {
  description = "(Optional) Identifier of the AWS KMS customer managed key for EventBridge to use, if you choose to use a customer managed key to encrypt events on this event bus. The identifier can be the key ARN, KeyId, key alias, or key alias ARN"
  type        = string
  default     = null
}
variable "cloudwatch_event_bus_name" {
  description = "(Required) Name of the new event bus. The names of custom event buses can't contain the / character. To create a partner event bus, ensure that the name matches the event_source_name"
  type        = string
}
variable "cloudwatch_event_bus_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = {}
}
variable "cloudwatch_event_bus_dead_letter_config" {
  description = "(Optional) Configuration details of the Amazon SQS queue for EventBridge to use as a dead-letter queue (DLQ). This block supports the following arguments "
  type        = list(object({
    arn = optional(string)
  }))
  default     = []
}
variable "cloudwatch_event_bus_log_config" {
  description = "(Optional) Block for logging configuration settings for the event bus"
  type        = list(object({
    include_detail = optional(string)
    level          = optional(string)
  }))
  default     = []
}
