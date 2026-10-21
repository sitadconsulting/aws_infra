resource "aws_kinesis_video_stream" "kinesis_video_stream" {
  data_retention_in_hours = var.kinesis_video_stream_data_retention_in_hours
  device_name             = var.kinesis_video_stream_device_name
  kms_key_id              = var.kinesis_video_stream_kms_key_id
  media_type              = var.kinesis_video_stream_media_type
  name                    = var.kinesis_video_stream_name
  tags                    = var.kinesis_video_stream_tags
}
