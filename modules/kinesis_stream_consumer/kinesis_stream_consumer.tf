resource "aws_kinesis_stream_consumer" "kinesis_stream_consumer" {
  name       = var.kinesis_stream_consumer_name
  stream_arn = var.kinesis_stream_consumer_stream_arn
}
