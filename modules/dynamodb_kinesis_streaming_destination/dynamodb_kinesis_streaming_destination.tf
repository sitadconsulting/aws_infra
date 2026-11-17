resource "aws_dynamodb_kinesis_streaming_destination" "dynamodb_kinesis_streaming_destination" {
  approximate_creation_date_time_precision = var.dynamodb_kinesis_streaming_destination_approximate_creation_date_time_precision
  stream_arn                               = var.dynamodb_kinesis_streaming_destination_stream_arn
  table_name                               = var.dynamodb_kinesis_streaming_destination_table_name
}
