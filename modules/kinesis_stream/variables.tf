variable "kinesis_stream_encryption_type" {
  description = "The encryption type to use. The only acceptable values are NONE or KMS. The default value is NONE"
  type        = string
  default     = "NONE"
}
variable "kinesis_stream_enforce_consumer_deletion" {
  description = "Whether all registered consumers should be deregistered from the stream so that the stream can be destroyed without error. The default value is false"
  type        = bool
  default     = false
}
variable "kinesis_stream_kms_key_id" {
  description = "The GUID for the customer-managed KMS key to use for encryption. You can also use a Kinesis-owned master key by specifying the alias alias/aws/kinesis"
  type        = string
  default     = ""
}
variable "kinesis_stream_name" {
  description = "A name to identify the stream. This is unique to the AWS account and region the Stream is created in"
  type        = string
}
variable "kinesis_stream_retention_period" {
  description = "Length of time data records are accessible after they are added to the stream. The maximum value of a stream's retention period is 8760 hours. Minimum value is 24. Default is 24"
  type        = number
  default     = 24
}
variable "kinesis_stream_shard_count" {
  description = "The number of shards that the stream will use. If the stream_mode is PROVISIONED, this field is required"
  type        = number
  default     = null
}
variable "kinesis_stream_shard_level_metrics" {
  description = "A list of shard-level CloudWatch metrics which can be enabled for the stream"
  type        = list(string)
  default     = []
}
variable "kinesis_stream_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "kinesis_stream_stream_mode_details" {
  description = "Configuraion for the capacity mode of the data stream"
  type        = list(object({
    stream_mode = string
  }))
  default     = []
}
