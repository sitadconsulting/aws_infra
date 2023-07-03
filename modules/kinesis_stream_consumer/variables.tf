variable "kinesis_stream_consumer_name" {
  description = "Name of the stream consumer"
  type        = string
}
variable "kinesis_stream_consumer_stream_arn" {
  description = "ARN of the data stream the consumer is registered with"
  type        = string
}
