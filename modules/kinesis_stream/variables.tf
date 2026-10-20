variable "kinesis_stream_encryption_type" {
  description = "(Optional) Encryption type to use. The only acceptable values are NONE or KMS. The default value is NONE"
  type        = string
  default     = "NONE"
}
variable "kinesis_stream_enforce_consumer_deletion" {
  description = "(Optional) Whether to deregister all registered consumers from the stream so that the stream can be destroyed without error. The default value is false"
  type        = bool
  default     = false
}
variable "kinesis_stream_kms_key_id" {
  description = "(Optional) Identifier for the customer-managed KMS key to use for encryption. This can be a Key ID (UUID), a Key ARN, an Alias Name (prefixed with alias/), or an Alias ARN. You can also use a master key owned by Kinesis Data Streams by specifying the alias aws/kinesis"
  type        = string
  default     = null
}
variable "kinesis_stream_max_record_size_in_kib" {
  description = "(Optional) Maximum size for a single data record in KiB. The minimum value is 1024. The maximum value is 10240"
  type        = number
  default     = null
}
variable "kinesis_stream_name" {
  description = "(Required) Name to identify the stream. This is unique to the AWS account and region the Stream is created in"
  type        = string
}
variable "kinesis_stream_retention_period" {
  description = "(Optional) Length of time data records are accessible after they are added to the stream. The maximum value of a stream's retention period is 8760 hours. Minimum value is 24. Default is 24"
  type        = number
  default     = 24
}
variable "kinesis_stream_shard_count" {
  description = "(Optional) Number of shards that the stream will use. If the stream_mode is PROVISIONED, this field is required. Amazon has guidelines for specifying the Stream size that should be referenced when creating a Kinesis stream"
  type        = number
  default     = null
}
variable "kinesis_stream_shard_level_metrics" {
  description = " (Optional) List of shard-level CloudWatch metrics which can be enabled for the stream. Note that the value ALL should not be used; instead you should provide an explicit list of metrics you wish to enable"
  type        = list(string)
  default     = []
}
variable "kinesis_stream_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "kinesis_stream_warm_throughput_mib_ps" {
  description = "(Optional) Target warm throughput in MB/s that the stream should be scaled to handle"
  type        = number
  default     = null
}
variable "kinesis_stream_stream_mode_details" {
  description = "(Optional) Capacity mode of the data stream"
  type        = list(object({
    stream_mode = string
  }))
  default     = []
}
