variable "kinesis_stream_consumer_name" {
  description = "(Required, Forces new resource) Name of the stream consumer"
  type        = string
}
variable "kinesis_stream_consumer_stream_arn" {
  description = "(Required, Forces new resource) ARN of the data stream the consumer is registered with"
  type        = string
}
variable "kinesis_stream_consumer_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
