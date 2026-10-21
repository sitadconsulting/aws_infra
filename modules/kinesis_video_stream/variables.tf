variable "kinesis_video_stream_data_retention_in_hours" {
  description = "(Optional) Number of hours that you want to retain the data in the stream. Kinesis Video Streams retains the data in a data store that is associated with the stream. The default value is 0, indicating that the stream does not persist data"
  type        = number
  default     = null
}
variable "kinesis_video_stream_device_name" {
  description = "(Optional) Name of the device that is writing to the stream. In the current implementation, Kinesis Video Streams does not use this name"
  type        = string
  default     = null
}
variable "kinesis_video_stream_kms_key_id" {
  description = "(Optional) ID of the KMS key that you want Kinesis Video Streams to use to encrypt stream data. If no key ID is specified, the default, Kinesis Video-managed key (aws/kinesisvideo) is used"
  type        =  string
  default     = null
}
variable "kinesis_video_stream_media_type" {
  description = "(Optional) Media type of the stream. Consumers of the stream can use this information when processing the stream"
  type        = string
  default     = null
}
variable "kinesis_video_stream_name" {
  description = "(Required) Name to identify the stream. Unique to the AWS account and region the stream is created in"
  type        = string
}
variable "kinesis_video_stream_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
