variable "dynamodb_kinesis_streaming_destination_stream_arn" {
  description = "The ARN for a Kinesis data stream. This must exist in the same account and region as the DynamoDB table"
  type        = string
}
variable "dynamodb_kinesis_streaming_destination_table_name" {
  description = "The name of the DynamoDB table. There can only be one Kinesis streaming destination for a given DynamoDB table"
  type        = string
}
