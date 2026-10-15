variable "msk_channel_channel_name" {
  description = "(Required) Name of the channel. Must be unique within the cluster. Changing this forces a new resource to be created"
  type        = string
}
variable "msk_channel_cluster_arn" {
  description = "(Required) ARN that uniquely identifies the cluster. Changing this forces a new resource to be created"
  type        = string
}
variable "msk_channel_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = {}
}
variable "msk_channel_encryption_configuration" {
  description = "(Optional) AWS KMS encryption configuration applied to data at rest. Changing this forces a new resource to be created"
  type        = list(object({
    kms_key_arn = string
  }))
  default     = []
}
variable "msk_channel_iceberg_destination" {
  description = "(Optional) Apache Iceberg destination for the channel. Exactly one of iceberg_destination or s3_destination is required. With the exception of data_freshness_in_seconds, changing an argument in this block forces a new resource to be created"
  type        = list(object({
    append_only                = bool
    compression_type           = optional(string)
    data_freshness_in_seconds  = optional(number)
    service_execution_role_arn = string
    catalog                    = optional(list(object({
      catalog_arn        = optional(string)
      warehouse_location = optional(string)
    })), [])
    dead_letter_queue_s3       = list(object({
      bucket_arn            = string
      error_output_prefix   = optional(string)
      expected_bucket_owner = optional(string)
    }))
    destination_table          = list(object({
      destination_database_name = optional(string)
      destination_table_name    = optional(string)
      partition_spec            = optional(list(object({
        partition_strategy = string
        source             = list(object({
          source_name = optional(string)
        }))
      })), [])
    }))
    schema_evolution           = list(object({
      enable_schema_evolution = optional(bool)
    }))
    table_creation             = list(object({
      enable_table_creation = optional(bool)
    }))
  }))
  default     = []
}
variable "msk_channel_logging_info" {
  description = "(Optional) Destinations to which the channel publishes operational logs. Changing this forces a new resource to be created"
  type        = list(object({
    cloudwatch_logs = optional(list(object({
      enabled   = bool
      log_group = optional(string)
    })), [])
    firehose        = optional(list(object({
      enabled         = bool
      delivery_stream = optional(string)
    })), [])
    s3              = optional(list(object({
      enabled = bool
      bucket  = optional(string)
      prefix  = optional(string)
    })), [])
  }))
  default     = []
}
variable "msk_channel_s3_destination" {
  description = "(Optional) Amazon S3 destination for the channel. Exactly one of iceberg_destination or s3_destination is required. With the exception of data_freshness_in_seconds, changing an argument in this block forces a new resource to be created"
  type        = list(object({
    data_freshness_in_seconds  = optional(number)
    service_execution_role_arn = string
    dead_letter_queue_s3       = list(object({
      bucket_arn            = string
      error_output_prefix   = optional(string)
      expected_bucket_owner = optional(string)
    }))
    storage                    = list(object({
      bucket_arn            = string
      compression_type      = string
      expected_bucket_owner = optional(string)
      output_key_template   = optional(string)
      output_prefix         = optional(string)
      storage_class         = string
    }))
  }))
  default     = []
}
variable "msk_channel_topic_configuration" {
  description = "(Required) Configuration of the Apache Kafka topic that feeds the channel. Changing this forces a new resource to be created"
  type        = list(object({
    topic_arn        = string
    record_converter = list(object({
      value_converter = string 
    })) 
    record_schema    = optional(list(object({
      gsr_arn = string
    })), [])
  }))
}
