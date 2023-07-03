output "kinesis_firehose_delivery_stream_arn" {
  description = "ARN of the firehose delivery stream"
  value       = element(concat(aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_stream.*.arn, [""]), 0)
}
