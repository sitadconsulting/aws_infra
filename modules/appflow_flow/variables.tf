variable "appflow_flow_description" {
  description = "(Optional) Description of the flow"
  type        = string
  default     = null
}
variable "appflow_flow_kms_arn" {
  description = "(Optional) ARN of the KMS key you provide for encryption. Required if you do not want to use the Amazon AppFlow-managed KMS key. Uses the Amazon AppFlow-managed KMS key when not provided"
  type        = string
  default     = null
}
variable "appflow_flow_name" {
  description = "(Required) Name of the flow"
  type        = string
}
variable "appflow_flow_tags" {
  description = "(Optional) Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
variable "appflow_flow_destination_flow_config" {
  description = "(Required) Configuration that controls how Amazon AppFlow places data in the destination connector"
  type        = list(object({
    api_version                      = optional(string)
    connector_profile_name           = optional(string)
    connector_type                   = string
    destination_connector_properties = list(object({
      custom_connector = optional(list(object({
        custom_properties     = optional(map(string))
        entity_name           = string
        id_field_names        = optional(list(string))
        write_operation_type  = optional(string)
        error_handling_config = optional(list(object({
          bucket_name                     = optional(string)
          bucket_prefix                   = optional(string)
          fail_on_first_destination_error = optional(bool)
        })), [])
      })), [])
      customer_profiles = optional(list(object({ 
        domain_name      = string
        object_type_name = optional(string)
      })), [])
      event_bridge      = optional(list(object({
        object                = string
        error_handling_config = optional(list(object({
          bucket_name                     = optional(string)
          bucket_prefix                   = optional(string)
          fail_on_first_destination_error = optional(bool)
        })), [])
      })), [])
      honeycode         = optional(list(object({
        object                = string
        error_handling_config = optional(list(object({
          bucket_name                     = optional(string)
          bucket_prefix                   = optional(string)
          fail_on_first_destination_error = optional(bool)
        })), [])
      })), [])
      marketo           = optional(list(object({
        object                = string
        error_handling_config = optional(list(object({
          bucket_name                     = optional(string)
          bucket_prefix                   = optional(string)
          fail_on_first_destination_error = optional(bool)
        })), [])
      })), [])
      redshift          = optional(list(object({
        bucket_prefix            = optional(string)
        intermediate_bucket_name = string
        object                   = string
        error_handling_config = optional(list(object({
          bucket_name                     = optional(string)
          bucket_prefix                   = optional(string)
          fail_on_first_destination_error = optional(bool)
        })), [])
      })), [])
      s3                = optional(list(object({
        bucket_name             = string
        bucket_prefix           = optional(string)
        s3_output_format_config = optional(list(object({
          file_type                   = optional(string)
          preserve_source_data_typing = optional(bool)
          aggregation_config          = optional(list(object({
            aggregation_type = optional(string)
            target_file_size = optional(number)
          })), [])
          prefix_config               = optional(list(object({
            prefix_format    = optional(string)
            prefix_hierarchy = optional(list(string))
            prefix_type      = optional(string)
          })), [])
        })), [])
      })), [])
      salesforce        = optional(list(object({
        data_transfer_api    = optional(string)
        id_field_names       = optional(list(string))
        object               = string
        write_operation_type = optional(string)
        error_handling_config = optional(list(object({
          bucket_name                     = optional(string)
          bucket_prefix                   = optional(string)
          fail_on_first_destination_error = optional(bool)
        })), [])
      })), [])
      sapo_data         = optional(list(object({
        id_field_names       = optional(list(string))
        object_path          = string
        write_operation_type = optional(string)
        error_handling_config = optional(list(object({
          bucket_name                     = optional(string)
          bucket_prefix                   = optional(string)
          fail_on_first_destination_error = optional(bool)
        })), [])
        success_response_handling_config = optional(list(object({
          bucket_name   = optional(string)
          bucket_prefix = optional(string)
        })), [])
      })), [])
      snowflake         = optional(list(object({
        bucket_prefix            = optional(string)
        intermediate_bucket_name = string
        object                   = string
        error_handling_config = optional(list(object({
          bucket_name                     = optional(string)
          bucket_prefix                   = optional(string)
          fail_on_first_destination_error = optional(bool)
        })), [])
      })), [])
      upsolver          = optional(list(object({
        bucket_name             = string
        bucket_prefix           = optional(string)
        s3_output_format_config = list(object({
          file_type          = optional(string)
          aggregation_config = optional(list(object({
            aggregation_type = optional(string)
          })), [])
          prefix_config      = list(object({
            prefix_format    = optional(string)
            prefix_hierarchy = optional(list(string))
            prefix_type      = string
          }))
        })) 
      })), [])
      zendesk           = optional(list(object({
        id_field_names       = optional(list(string))
        object               = string
        write_operation_type = optional(string)
        error_handling_config = optional(list(object({
          bucket_name                     = optional(string)
          bucket_prefix                   = optional(string)
          fail_on_first_destination_error = optional(bool)
        })), [])
      })), [])
    }))
  }))
}
variable "appflow_flow_metadata_catalog_config" {
  description = "(Optional) Configuration that determines how Amazon AppFlow catalogs the data that the flow transfers"
  type        = list(object({
    glue_data_catalog = optional(list(object({
      database_name = string
      role_arn      = string
      table_prefix  = string
    })), [])
  }))
}
variable "appflow_flow_source_flow_config" {
  description = "(Required) Configuration that controls how Amazon AppFlow retrieves data from the source connector"
  type        = list(object({
    api_version                 = optional(string)
    connector_profile_name      = optional(string)
    connector_type              = string
    incremental_pull_config     = optional(list(object({
      datetime_type_field_name = optional(string)
    })), [])
    source_connector_properties = list(object({
      amplitude        = optional(list(object({
        object = string
      })), [])
      custom_connector = optional(list(object({
        custom_properties = optional(map(string))
        entity_name       = string
      })), [])
      datadog          = optional(list(object({
        object = string
      })), [])
      dynatrace        = optional(list(object({
        object = string
      })), [])
      google_analytics = optional(list(object({
        object = string
      })), [])
      infor_nexus      = optional(list(object({
        object = string
      })), [])
      marketo          = optional(list(object({
        object = string
      })), [])
      s3               = optional(list(object({
        bucket_name            = string
        bucket_prefix          = string
        s3_input_format_config = optional(list(object({
          s3_input_file_type = optional(string)
        })), [])
      })), [])
      salesforce       = optional(list(object({
        data_transfer_api           = optional(string)
        enable_dynamic_field_update = optional(bool)
        include_deleted_records     = optional(bool)
        object                      = string
      })), [])
      sapo_data        = optional(list(object({
        object_path       = string
        pagination_config  = optional(list(object({
          max_page_size = number
        })), [])
        parallelism_config = optional(list(object({
          max_page_size = number
        })), [])
      })), [])
      service_now      = optional(list(object({
        object = string
      })), [])
      singular         = optional(list(object({
        object = string
      })), [])
      slack            = optional(list(object({
        object = string
      })), [])
      trendmicro       = optional(list(object({
        object = string
      })), [])
      veeva            = optional(list(object({
        document_type        = optional(string)
        include_all_versions = optional(bool)
        include_renditions   = optional(bool)
        include_source_files = optional(bool)
        object               = string
      })), [])
      zendesk          = optional(list(object({
        object = string
      })), [])
    }))
  }))
}
variable "appflow_flow_task" {
  description = "(Required) Tasks that Amazon AppFlow performs while transferring the data in the flow run"
  type        = list(object({
    destination_field  = optional(string)
    source_fields      = optional(list(string))
    task_properties    = optional(map(string))
    task_type          = string
    connector_operator = optional(list(object({
      amplitude        = optional(string)
      custom_connector = optional(string)
      datadog          = optional(string)
      dynatrace        = optional(string)
      google_analytics = optional(string)
      infor_nexus      = optional(string)
      marketo          = optional(string)
      s3               = optional(string)
      salesforce       = optional(string)
      sapo_data        = optional(string)
      service_now      = optional(string)
      singular         = optional(string)
      slack            = optional(string)
      trendmicro       = optional(string)
      veeva            = optional(string)
      zendesk          = optional(string)
    })), [])
  }))
}
variable "appflow_flow_trigger_config" {
  description = "(Required) Configuration that determines how and when the flow runs"
  type        = list(object({
    trigger_type       = string
    trigger_properties = optional(list(object({
      scheduled = optional(list(object({
        data_pull_mode       = optional(string)
        first_execution_from = optional(string)
        schedule_end_time    = optional(string)
        schedule_expression  = string
        schedule_offset      = optional(number)
        schedule_start_time  = optional(string)
        timezone             = optional(string)
      })), [])
    })), [])
  }))
}
