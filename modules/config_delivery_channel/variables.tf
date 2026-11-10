variable "config_delivery_channel_name" {
  description = "(Optional) The name of the delivery channel. Defaults to default. Changing it recreates the resource" 
  type        = string
  default     = null
}
variable "config_delivery_channel_s3_bucket_name" {
  description = "(Required) The name of the S3 bucket used to store the configuration history" 
  type        = string
}
variable "config_delivery_channel_s3_key_prefix" {
  description = "(Optional) The prefix for the specified S3 bucket" 
  type        = string
  default     = null
}
variable "config_delivery_channel_s3_kms_key_arn" {
  description = "(Optional) The ARN of the AWS KMS key used to encrypt objects delivered by AWS Config. Must belong to the same Region as the destination S3 bucket" 
  type        = string
  default     = null
}
variable "config_delivery_channel_sns_topic_arn" {
  description = "(Optional) The ARN of the SNS topic that AWS Config delivers notifications to" 
  type        = string
  default     = null
}
variable "config_delivery_channel_snapshot_delivery_properties" {
  description = "(Optional) Options for how AWS Config delivers configuration snapshots" 
  type        = list(object({
    delivery_frequency = optional(string)
  }))
  default     = []
}
