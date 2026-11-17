variable "dynamodb_kinesis_streaming_destination_approximate_creation_date_time_precision" {
  description = "(Optional) Toggle for the precision of Kinesis data stream timestamp. Valid values: MILLISECOND and MICROSECOND"
  type        = string
  default     = null
}
variable "dynamodb_kinesis_streaming_destination_stream_arn" {
  description = "(Required) The ARN for a Kinesis data stream. This must exist in the same account and region as the DynamoDB table"
  type        = string
}
variable "dynamodb_kinesis_streaming_destination_table_name" {
  description = "(Required) The name of the DynamoDB table. There can only be one Kinesis streaming destination for a given DynamoDB table"
  type        = string
}
