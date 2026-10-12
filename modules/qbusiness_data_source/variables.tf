variable "qbusiness_data_source_application_id" {
  description = "The identifier of the Amazon Q Business application the data source will be attached to" 
  type        = string
}
variable "qbusiness_data_source_configuration" {
  description = "Use this property to specify a JSON or YAML schema with configuration properties specific to your data source connector to connect your data source repository to Amazon Q Business. You must use the JSON or YAML schema provided by Amazon Q"
  type        = string
}
variable "qbusiness_data_source_description" {
  description = "A description for the data source connector"
  type        = string
  default     = null
}
variable "qbusiness_data_source_display_name" {
  description = "The name of the Amazon Q Business data source"
  type        = string
}
variable "qbusiness_data_source_index_id" {
  description = "The identifier of the index the data source is attached to"
  type        = string
}
variable "qbusiness_data_source_role_arn" {
  description = "ARN of an IAM role with permission to access the data source and required resources"
  type        = string
  default     = null
}
variable "qbusiness_data_source_sync_schedule" {
  description = "Sets the frequency for Amazon Q Business to check the documents in your data source repository and update your index. If you don't set a schedule, Amazon Q Business won't periodically update the index. Specify a cron- format schedule string or an empty string to indicate that the index is updated on demand. You can't specify the Schedule parameter when the Type parameter is set to CUSTOM. If you do, you receive a ValidationException exception"
  type        = string
  default     = null
}
variable "qbusiness_data_source_tags" {
  description = "A list of key-value pairs that identify or categorize the data source connector"
  type        = list(object({
    key   = optional(string)
    value = optional(string)
  }))
  default     = []
}
variable "qbusiness_data_source_document_enrichment_configuration" {
  description = "Provides the configuration information for altering document metadata and content during the document ingestion process"
  type        = object({
    inline_configurations = optional(list(object({
      document_content_operator = optional(string)
      condition = optional(object({
        key      = optional(string)
        operator = optional(string)
        value    = optional(object({
          date_value        = optional(string)
          long_value        = optional(number)
          string_list_value = optional(list(string))
          string_value      = optional(string)
        }), {})
      }), {})
      target = optional(object({
        attribute_value_operator = optional(string)
        key                      = optional(string)
        value                    = optional(object({
          date_value        = optional(string)
          long_value        = optional(number)
          string_list_value = optional(list(string))
          string_value      = optional(string)
        }), {})
      }), {})
    })), []) 
    post_extraction_hook_configuration = optional(object({
      lambda_arn           = optional(string)
      role_arn             = optional(string)
      s3_bucket_name       = optional(string)
      invocation_condition = optional(object({
        key      = optional(string)
        operator = optional(string)
        value    = optional(object({
          date_value        = optional(string)
          long_value        = optional(number)
          string_list_value = optional(list(string))
          string_value      = optional(string)
        }), {})
      }), {})
    }), {})
    pre_extraction_hook_configuration = optional(object({
      lambda_arn           = optional(string)
      role_arn             = optional(string)
      s3_bucket_name       = optional(string)
      invocation_condition = optional(object({
        key      = optional(string)
        operator = optional(string)
        value    = optional(object({
          date_value        = optional(string)
          long_value        = optional(number)
          string_list_value = optional(list(string))
          string_value      = optional(string)
        }), {})
      }), {})
    }), {})
  })
  default     = null
}
variable "qbusiness_data_source_media_extraction_configuration" {
  description = "The configuration for multimodal information extraction"
  type        = object({
    audio_extraction_configuration = optional(object({
      audio_extraction_status = optional(string)
    }), {})
    image_extraction_configuration = optional(object({
      image_extraction_status = optional(string)
    }), {})
    video_extraction_configuration = optional(object({
      video_extraction_status = optional(string)
    }), {})
  })
  default     = null
}
variable "qbusiness_data_source_vpc_configuration" {
  description = "Configuration information for an Amazon VPC (Virtual Private Cloud) to connect to your data source"
  type        = object({
    security_group_ids = optional(list(string))
    subnet_ids         = optional(list(string))
  })
  default     = null
}
