variable "kinesis_analytics_application_code" {
  description = "SQL Code to transform input data, and generate output"
  type        = string
  default     = ""
}
variable "kinesis_analytics_application_description" {
  description = "Description of the application"
  type        = string
  default     = ""
}
variable "kinesis_analytics_application_name" {
  description = "Name of the Kinesis Analytics Application"
  type        = string
}
variable "kinesis_analytics_application_start_application" {
  description = "Whether to start or stop the Kinesis Analytics Application. To start an application, an input with a defined starting_position must be configured. To modify an application's starting position, first stop the application by setting start_application = false, then update starting_position and set start_application = true"
  type        = bool
  default     = false
}
variable "kinesis_analytics_application_tags" {
  description = "Key-value map of tags for the Kinesis Analytics Application"
  type        = map(string)
  default     = {}
}
variable "kinesis_analytics_application_cloudwatch_logging_options" {
  description = "The CloudWatch log stream options to monitor application errors"
  type        = list(object({
    log_stream_arn = string
    role_arn       = string
  }))
  default     =
}
variable "kinesis_analytics_application_inputs" {
  description = "Application input configuration"
  type        = list(object({
    name_prefix    = string
    kinesis_firehose = optional(list(object({
      resource_arn = string
      role_arn     = string
    })))
    kinesis_stream   = optional(list(object({
      resource_arn = string
      role_arn     = string
    })))
    parallelism      = optional(list(object({
      count        = number
    })))
    processing_configuration = optional(list(object({
      lambda         = list(object({
        resource_arn = string
        role_arn     = string
      }))
    })))
    schema           = list(object({
      record_encoding = optional(string)
      record_columns = list(object({
        mapping  = optional(string)
        name     = string
        sql_type = string 
      }))
      record_format  = list(object({
        record_format_type = string
        mapping_parameters = optional(list(object({
          csv              = optional(list(object({
            record_column_delimiter = string
            record_row_delimiter    = string
          })))
          json             = optional(list(object({
            record_row_path = string
          })))
        })))
      }))
    }))
    starting_position_configuration = optional(list(object({
      starting_position = optional(string)
    })))
  }))
  default     = []
}
variable "kinesis_analytics_application_outputs" {
  description = "Application output configuration "
  type        = list(object({
    name = string
    kinesis_firehose = optional(list(object({
      resource_arn = string
      role_arn     = string
    })))
    kinesis_stream   = optional(list(object({
      resource_arn = string
      role_arn     = string
    })))
    lambda           = optional(list(object({
      resource_arn = string
      role_arn     = string
    })))
    schema           = list(object({
      record_format_type = string
    }))
  }))
  default     = []
}
variable "kinesis_analytics_application_reference_data_sources" {
  description = "An S3 Reference Data Source for the application"
  type        = list(object({
    table_name = string
    s3        = list(object({
     bucket_arn = string
     file_key   = string
     role_arn   = string
    }))
    schema   = list(object({
      record_encoding = optional(string)
      record_columns = list(object({
        mapping   = optional(string)
        name      = string
        sql_type  = string
      }))
      record_format = list(object({
        record_format_type = string
        mapping_parameters = optional(list(object({
          csv  = optional(list(object({
            record_column_delimiter = string
            record_row_delimiter    = string
          })))
          json = optional(list(object({
            record_row_path = string 
          })))
        })))
      }))
    }))
  }))
  default     = []
}
