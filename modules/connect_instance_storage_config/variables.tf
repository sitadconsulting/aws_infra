variable "connect_instance_storage_config_instance_id" {
  description = "(Required) Specifies the identifier of the hosting Amazon Connect Instance"
  type        = string
}
variable "connect_instance_storage_config_resource_type" {
  description = "(Required) A valid resource type. Valid Values: AGENT_EVENTS | ATTACHMENTS | CALL_RECORDINGS | CHAT_TRANSCRIPTS | CONTACT_EVALUATIONS | CONTACT_TRACE_RECORDS | EMAIL_MESSAGES | MEDIA_STREAMS | REAL_TIME_CONTACT_ANALYSIS_CHAT_SEGMENTS | REAL_TIME_CONTACT_ANALYSIS_SEGMENTS | REAL_TIME_CONTACT_ANALYSIS_VOICE_SEGMENTS | SCHEDULED_REPORTS | SCREEN_RECORDINGS"
  type        = string
}
variable "connect_instance_storage_config_storage_config" {
  description = "(Required) Specifies the storage configuration options for the Connect Instance"
  type        = list(object({
    storage_type                = string
    kinesis_firehose_config     = optional(list(object({
      firehose_arn = string
    })), [])
    kinesis_stream_config       = optional(list(object({
      stream_arn = string
    })), [])
    kinesis_video_stream_config = optional(list(object({
      prefix                 = string
      retention_period_hours = number
      encryption_config      = list(object({
        encryption_type = string
        key_id          = string
      }))
    })), [])
    s3_config                   = optional(list(object({
      bucket_name   = string
      bucket_prefix = string
      encryption_config      = list(object({
        encryption_type = string
        key_id          = string
      }))
    })), [])
  }))
}
