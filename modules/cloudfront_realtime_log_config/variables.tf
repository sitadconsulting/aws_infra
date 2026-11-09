variable "cloudfront_realtime_log_config_fields" {
  description = "(Required) The fields that are included in each real-time log record. This includes viewer-request-log-data and viewer-response-log-data, which carry the custom data that a CloudFront Function logs with cf.logCustomData()"
  type        = string
}
variable "cloudfront_realtime_log_config_name" {
  description = "(Required) The unique name to identify this real-time log configuration"
  type        = string
}
variable "cloudfront_realtime_log_config_sampling_rate" {
  description = "(Required) The sampling rate for this real-time log configuration. The sampling rate determines the percentage of viewer requests that are represented in the real-time log data. An integer between 1 and 100, inclusive"
  type        = number
}
variable "cloudfront_realtime_log_config_endpoint" {
  description = "(Required) The Amazon Kinesis data streams where real-time log data is sent"
  type        = list(object({
    stream_type           = string
    kinesis_stream_config = list(object({
      role_arn   = string
      stream_arn = string
    }))
  }))
}
