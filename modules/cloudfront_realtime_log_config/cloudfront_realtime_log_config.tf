resource "aws_cloudfront_realtime_log_config" "cloudfront_realtime_log_config" {
  fields        = var.cloudfront_realtime_log_config_fields
  name          = var.cloudfront_realtime_log_config_name
  sampling_rate = var.cloudfront_realtime_log_config_sampling_rate
 
  dynamic "endpoint" {
    for_each = var.cloudfront_realtime_log_config_endpoint
      content {
        stream_type = endpoint.value["stream_type"]
        dynamic "kinesis_stream_config" {
          for_each = endpoint.value.kinesis_stream_config
            content {
              role_arn   = kinesis_stream_config.value["role_arn"]
              stream_arn = kinesis_stream_config.value["stream_arn"]
            }
        }
      }
  }
}
