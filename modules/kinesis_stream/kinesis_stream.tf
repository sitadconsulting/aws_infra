resource "aws_kinesis_stream" "kinesis_stream" {
  encryption_type           = var.kinesis_stream_encryption_type
  enforce_consumer_deletion = var.kinesis_stream_enforce_consumer_deletion
  kms_key_id                = var.kinesis_stream_kms_key_id
  max_record_size_in_kib    = var.kinesis_stream_max_record_size_in_kib
  name                      = var.kinesis_stream_name
  retention_period          = var.kinesis_stream_retention_period
  shard_count               = var.kinesis_stream_shard_count
  shard_level_metrics       = var.kinesis_stream_shard_level_metrics
  tags                      = var.kinesis_stream_tags
  warm_throughput_mib_ps    = var.kinesis_stream_warm_throughput_mib_ps

  dynamic "stream_mode_details" {
    for_each = var.kinesis_stream_stream_mode_details
      content {
        stream_mode = stream_mode_details.value["stream_mode"]
      }
  }
}
