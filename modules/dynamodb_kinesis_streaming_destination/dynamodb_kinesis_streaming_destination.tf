resource "aws_dynamodb_kinesis_streaming_destination" "dynamodb_kinesis_streaming_destination" {
  stream_arn = var.dynamodb_kinesis_streaming_destination_stream_arn
  table_name = var.dynamodb_kinesis_streaming_destination_table_name
}
