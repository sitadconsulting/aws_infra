variable "kinesisanalyticsv2_application_description" {
  description = "A summary description of the application"
  type        = string
  default     = ""
}
variable "kinesisanalyticsv2_application_force_stop" {
  description = "Whether to force stop an unresponsive Flink-based application"
  type        = bool
  default     = false
}
variable "kinesisanalyticsv2_application_name" {
  description = "The name of the application"
  type        = string
}
variable "kinesisanalyticsv2_application_runtime_environment" {
  description = "The runtime environment for the application. Valid values: SQL-1_0, FLINK-1_6, FLINK-1_8, FLINK-1_11, FLINK-1_13, FLINK-1_15"
  type        = string
  default     = null
}
variable "kinesisanalyticsv2_application_service_execution_role" {
  description = "The ARN of the IAM role used by the application to access Kinesis data streams, Kinesis Data Firehose delivery streams, Amazon S3 objects, and other external resources"
  type        = string
}
variable "kinesisanalyticsv2_application_start_application" {
  description = "Whether to start or stop the application"
  type        = bool
  default     = false
}
variable "kinesisanalyticsv2_application_tags" {
  description = "A map of tags to assign to the application"
  type        = map(string)
  default     = {}
}
variable "kinesisanalyticsv2_application_application_configuration" {
  description = "The application's configuration"
  type        = list(object({
    application_code_configuration = list(object({
      code_content_type = string
      code_content      = optional(list(object({
        text_content    = optional(string)
        s3_content_location = optional(list(object({
          bucket_arn     = string
          file_key       = string
          object_version = optional(string)
        })), [])
      })), [])
    }))
    application_snapshot_configuration = optional(list(object({
      snapshots_enabled = bool
    })), [])
    environment_properties = optional(list(object({
      property_group = list(object({
        property_group_id = string
        property_map      = map(string)
      }))
    })), [])
    flink_application_configuration = optional(list(object({
      checkpoint_configuration = optional(list(object({
        checkpointing_enabled         = bool
        checkpoint_interval           = optional(number)
        configuration_type            = string
        min_pause_between_checkpoints = optional(number) 
      })), [])
      monitoring_configuration = optional(list(object({
        configuration_type = string
        log_level          = optional(string)
        metrics_level      = optional(string)
      })), [])
      parallelism_configuration = optional(list(object({
        auto_scaling_enabled = bool
        configuration_type   = string
        parallelism          = optional(number)
        parallelism_per_kpu  = optional(number)
      })), [])
    })), [])
    run_configuration = optional(list(object({
      application_restore_configuration = optional(list(object({
        application_restore_type = optional(string)
        snapshot_name            = optional(string)
      })), [])
      flink_run_configuration = optional(list(object({
        allow_non_restored_state = optional(bool)
      })), [])
    })), [])
    sql_application_configuration = optional(list(object({
      input = optional(list(object({
        name_prefix = string
        input_parallelism = optional(list(object({
          count = optional(number)
        })), [])
        input_processing_configuration = optional(list(object({
          input_lambda_processor = list(object({
            resource_arn = string
          }))
        })), [])
        input_schema = list(object({
          record_encoding = optional(string)
          record_column   = list(object({
            mapping  = optional(string)
            name     = string
            sql_type = string
          }))
          record_format = list(object({
            record_format_type = string
            mapping_parameters = list(object({
              csv_mapping_parameters = optional(list(object({
                record_column_delimiter = string
                record_row_delimiter    = string
              })), [])
              json_mapping_parameters = optional(list(object({
                record_row_path = string
              })), [])
            }))
          }))
        }))
        input_starting_position_configuration = optional(list(object({
          input_starting_position = optional(string)
        })), [])
        kinesis_firehose_input = optional(list(object({
          resource_arn = string
        })), [])
        kinesis_streams_input = optional(list(object({
          resource_arn = string
        })), [])
      })), [])
      output = optional(list(object({
        name = string
        destination_schema = list(object({
          record_format_type = string
        }))
        kinesis_firehose_output = optional(list(object({
          resource_arn = string
        })), [])
        kinesis_streams_output = optional(list(object({
          resource_arn = string
        })), [])
        lambda_output = optional(list(object({
          resource_arn = string
        })), [])
      })), [])
      reference_data_source = optional(list(object({
        table_name = string
        reference_schema = list(object({
          record_encoding = optional(string)
          record_column = list(object({
            mapping  = optional(string)
            name     = string
            sql_type = string 
          })) 
          record_format = list(object({
            record_format_type = string
            mapping_parameters = list(object({
              cvs_mapping_parameters = optional(list(object({
                record_column_delimiter = string
                record_row_delimiter    = string
              })), [])
              json_mapping_parameters =  optional(list(object({
                record_row_path = string
              })), [])
            }))
          }))
        }))
        s3_reference_data_source = list(object({
          bucket_arn = string
          file_key   = string
        }))
      })), [])
    })), [])
    vpc_configuration = optional(list(object({
      security_group_ids = list(string)
      subnet_ids         = list(string)
    })), [])
  }))
  default     = []
}
variable "kinesisanalyticsv2_application_application_cloudwatch_logging_options" {
  description = "A CloudWatch log stream to monitor application configuration errors"
  type        = list(object({
    log_stream_arn = string
  }))
  default     = []
}
