variable "kinesis_firehose_delivery_stream_destination" {
  description = "(Required) Destination where the data is delivered. The only options are s3 (Deprecated, use extended_s3 instead), extended_s3, redshift, elasticsearch, splunk, http_endpoint, opensearch, opensearchserverless and snowflake"
  type        = string
} 
variable "kinesis_firehose_delivery_stream_destination_id" {
  description = "(Optional) Identifier of the destination for the delivery stream"
  type        = string
  default     = null
}
variable "kinesis_firehose_delivery_stream_name" {
  description = "(Required) Name to identify the stream. This is unique to the AWS account and region the Stream is created in. When using for WAF logging, name must be prefixed with aws-waf-logs-"
  type        = string
}
variable "kinesis_firehose_delivery_stream_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "kinesis_firehose_delivery_stream_version_id" {
  descrption = "(Optional) Version identifier of the delivery stream"
  type       = string
  default    = null
}
variable "kinesis_firehose_delivery_stream_elasticsearch_configuration" {
  description = "(Optional) Configuration options when destination is elasticsearch"
  type        = list(object({
    buffering_interval    = optional(number)
    buffering_size        = optional(number)
    cluster_endpoint      = optional(string)
    domain_arn            = optional(string)
    index_name            = string
    index_rotation_period = optional(string)
    retry_duration        = optional(number)
    role_arn              = string
    s3_bucket_mode        = optional(string)
    type_name             = optional(string)
    cloudwatch_logging_option = optional(list(object({
      enabled         = optional(bool)
      log_group_name  = optional(string)
      log_stream_name = optional(string)
    })), [])
    processing_configuration = optional(list(object({
      enabled    = optional(bool)
      processors = optional(list(object({
        type     = string
        parameters = optional(list(object({
          parameter_name  = string
          parameter_value = string
        })), [])
      })), [])
    })), [])
    s3_configuration = list(object({
      bucket_arn          = string
      buffering_interval  = optional(number)
      buffering_size      = optional(number)
      compression_format  = optional(string)
      error_output_prefix = optional(string)
      kms_key_arn         = optional(string)
      prefix              = optional(string)
      role_arn            = string
      cloudwatch_logging_option = optional(list(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      })), [])
    }))
    vpc_config = optional(list(object({
      subnet_ids         = list(string)
      security_group_ids = list(string)
      role_arn           = string
    })), [])
  }))
  default     = []
}
variable "kinesis_firehose_delivery_stream_extended_s3_configuration" {
  description = "(Optional, only Required when destination is extended_s3) Enhanced configuration options for the s3 destination"
  type        = list(object({
    bucket_arn          = string
    buffering_interval  = optional(number) 
    buffering_size      = optional(number)
    compression_format  = optional(string)
    custom_time_zone    = optional(string)
    error_output_prefix = optional(string)
    file_extension      = optional(string)
    kms_key_arn         = optional(string)
    prefix              = optional(string)
    role_arn            = string
    s3_backup_mode      = optional(string)
    data_format_conversion_configuration = optional(list(object({
      enabled = optional(bool)
      input_format_configuration = list(object({
        deserializer = list(object({
          hive_json_ser_de   = optional(list(object({
            timestamp_format = optional(list(string))
          })), [])
          open_x_json_ser_de = optional(list(object({
            case_insensitive                         = optional(bool)
            column_to_json_key_mappings              = optional(map(string))
            convert_dots_in_json_keys_to_underscores = optional(bool)
          })), []) 
        }))
      }))
      output_format_configuration = list(object({
        serializer = list(object({
          orc_ser_de = optional(list(object({
            block_size_bytes                        = optional(number)
            bloom_filter_columns                    = optional(list(string))
            bloom_filter_false_positive_probability = optional(number)
            compression                             = optional(string)
            dictionary_key_threshold                = optional(number)
            enable_padding                          = optional(bool)
            format_version                          = optional(string)
            padding_tolerance                       = optional(number)
            row_index_stride                        = optional(number)
            stripe_size_bytes                       = optional(number)
          })), [])
          parquet_ser_de = optional(list(object({
            block_size_bytes              = optional(number)
            compression                   = optional(string)
            enable_dictionary_compression = optional(bool)
            max_padding_bytes             = optional(number)
            page_size_bytes               = optional(number)
            writer_version                = optional(string)
          })), [])
        }))
      }))
      schema_configuration = list(object({
        catalog_id    = optional(string)
        database_name = string
        region        = optional(string)
        role_arn      = string
        table_name    = string
        version_id    = optional(string)
      }))
    })), []) 
    cloudwatch_logging_option = optional(list(object({
       enabled         = optional(bool)
       log_group_name  = optional(string)
       log_stream_name = optional(string)
    })), [])
    dynamic_partitioning_configuration = optional(list(object({
      enabled        = optional(bool)
      retry_duration = optional(number)
    })), [])
    processing_configuration = optional(list(object({
      enabled    = optional(bool)
      processors = optional(list(object({
        type     = string
        parameters = optional(list(object({
          parameter_name  = string
          parameter_value = string
        })), [])
      })), [])
    })), [])
    s3_backup_configuration = optional(list(object({
      bucket_arn                 = string
      buffering_interval         = optional(number)
      buffering_size             = optional(number)
      compression_format         = optional(string)
      error_output_prefix        = optional(string)
      kms_key_arn                = optional(string)
      prefix                     = optional(string)
      role_arn                   = string
      cloudwatch_logging_options = optional(list(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      })), [])
    })), [])
  }))
  default     =  []
}
variable "kinesis_firehose_delivery_stream_http_endpoint_configuration" {
  description = "(Optional) Configuration options when destination is http_endpoint. Requires the user to also specify an s3_configuration block"
  type        = list(object({
    access_key         = optional(string)
    buffering_interval = optional(number)
    buffering_size     = optional(number)
    name               = optional(string)
    retry_duration     = optional(number)
    role_arn           = optional(string)
    s3_backup_mode     = optional(string)
    url                = string
    cloudwatch_logging_option = optional(list(object({
      enabled         = optional(bool)
      log_group_name  = optional(string)
      log_stream_name = optional(string)
    })), [])
    processing_configuration = optional(list(object({
      enabled    = optional(bool)
      processors = optional(list(object({
        type     = string
        parameters = optional(list(object({
          parameter_name  = string
          parameter_value = string
        })), [])
      })), [])
    })), [])
    request_configuration = optional(list(object({
      content_encoding = optional(string)
      common_attributes = optional(list(object({
        name  = string
        value = string
      })), [])
    })), [])
    s3_configuration = list(object({
      bucket_arn          = string
      buffering_interval  = optional(number)
      buffering_size      = optional(number)
      compression_format  = optional(string)
      error_output_prefix = optional(string)
      kms_key_arn         = optional(string)
      prefix              = optional(string)
      role_arn            = string
      cloudwatch_logging_option = optional(list(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      })), [])
    }))
    secrets_manager_configuration = optional(list(object({
      enabled    = optional(bool)
      secret_arn = optional(string)
      role_arn   = optional(string)
    })), [])
  }))
  default     = []
}
variable "kinesis_firehose_delivery_stream_iceberg_configuration" {
  description = "(Optional) Configuration options when destination is iceberg"
  type        = list(object({
    append_only        = optional(bool)
    buffering_interval = optional(number)
    buffering_size     = optional(nmber)
    catalog_arn        = string
    retry_duration     = optional(number)
    role_arn           = string
    s3_backup_mode     = optional(string)
    cloudwatch_logging_options      = optional(list(object({
      enabled         = optional(bool)
      log_group_name  = optional(string)
      log_stream_name = optional(string)
    })), [])
    destination_table_configuration = optional(list(object({
      database_name          = string
      table_name             = string
      s3_error_output_prefix = optiona(string)
      unique_keys            = optional(list(string))
    })), [])
    processing_configuration        = optional(list(object({
      enabled    = optional(bool)
      processors = optional(list(object({
        type       = string
        parameters = optional(list(object({
          parameter_name  = string
          parameter_value = string
        })), [])
      })), [])
    })), [])
    s3_configuration                = list(object({
      bucket_arn                 = string
      buffering_interval         = optional(number)
      buffering_size             = optional(number)
      compression_format         = optional(string)
      error_output_prefix        = optional(string)
      kms_key_arn                = optional(string)
      prefix                     = optional(string)
      role_arn                   = string
      cloudwatch_logging_options = optional(list(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      })), [])
    }))
  }))
  default     = []
}
variable "kinesis_firehose_delivery_stream_kinesis_source_configuration" {
  description = "(Optional) Stream and role ARNs for a Kinesis data stream used as the source for a delivery stream"
  type        = list(object({
    kinesis_stream_arn = string
    role_arn           = string
  }))
  default     =  []
}
variable "kinesis_firehose_delivery_stream_msk_source_configuration" {
  description = "(Optional) Configuration for the Amazon MSK cluster to be used as the source for a delivery stream"
  type        = list(object({
    msk_cluster_arn              = string
    read_from_timestamp          = optional(string)
    topic_name                   = string
    authentication_configuration = list(object({
      connectivity = string
      role_arn     = string
    }))
  }))
  default     = []
}
variable "kinesis_firehose_delivery_stream_opensearch_configuration" {
  description = "(Optional) Configuration options when destination is opensearch"
  type        = list(object({
    buffering_interval    = optional(number)
    buffering_size        = optional(number)
    cluster_endpoint      = optional(string)
    domain_arn            = optional(string)
    index_name            = string
    index_rotation_period = optional(string)
    retry_duration        = optional(number)
    role_arn              = string
    s3_backup_mode        = optional(string)
    type_name             = optional(string)
    cloudwatch_logging_option = optional(list(object({
      enabled         = optional(bool)
      log_group_name  = optional(string)
      log_stream_name = optional(string)
    })), [])
    document_id_options = optional(list(object({
      default_document_id_format = string
    })), [])
    processing_configuration = optional(list(object({
      enabled    = optional(bool)
      processors = optional(list(object({
        type     = string
        parameters = optional(list(object({
          parameter_name  = string
          parameter_value = string
        })), [])
      })), [])
    })), [])
    s3_configuration = list(object({
      bucket_arn          = string
      buffering_interval  = optional(number)
      buffering_size      = optional(number)
      compression_format  = optional(string)
      error_output_prefix = optional(string)
      kms_key_arn         = optional(string)
      prefix              = optional(string)
      role_arn            = string
      cloudwatch_logging_option = optional(list(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      })), [])
    }))
    vpc_config = optional(list(object({
      subnet_ids         = list(string)
      security_group_ids = list(string)
      role_arn           = string
    })), [])
  }))
  default     = []
}
variable "kinesis_firehose_delivery_stream_opensearchserverless_configuration" {
  description = "(Optional) Configuration options when destination is opensearchserverless"
  type        = list(object({
    buffering_interval  = optional(number)
    buffering_size      = optional(number)
    collection_endpoint = string
    index_name          = string
    retry_duration      = optional(number)
    role_arn            = string
    s3_backup_mode      = optional(number)
    cloudwatch_logging_option = optional(list(object({
      enabled         = optional(bool)
      log_group_name  = optional(string)
      log_stream_name = optional(string)
    })), [])
    processing_configuration = optional(list(object({
      enabled    = optional(bool)
      processors = optional(list(object({
        type     = string
        parameters = optional(list(object({
          parameter_name  = string
          parameter_value = string
        })), [])
      })), [])
    })), [])
    s3_configuration = list(object({
      bucket_arn          = string
      buffering_interval  = optional(number)
      buffering_size      = optional(number)
      compression_format  = optional(string)
      error_output_prefix = optional(string)
      kms_key_arn         = optional(string)
      prefix              = optional(string)
      role_arn            = string
      cloudwatch_logging_option = optional(list(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      })), [])
    }))
    vpc_config = optional(list(object({
      subnet_ids         = list(string)
      security_group_ids = list(string)
      role_arn           = string
    })), [])
  }))
  default     = []
} 
variable "kinesis_firehose_delivery_stream_redshift_configuration" {
  description = "(Optional) Configuration options when destination is redshift. Requires the user to also specify an s3_configuration"
  type        = list(object({
    cluster_jdbcurl    = string
    copy_options       = optional(string)
    data_table_columns = optional(string)
    data_table_name    = string
    password           = optional(string)
    retry_duration     = optional(number)
    role_arn           = string
    s3_backup_mode     = optional(string)
    username           = optional(string)
    cloudwatch_logging_option = optional(list(object({
      enabled         = optional(bool)
      log_group_name  = optional(string)
      log_stream_name = optional(string)
    })), [])
    processing_configuration = optional(list(object({
      enabled    = optional(bool)
      processors = optional(list(object({
        type     = string
        parameters = optional(list(object({
          parameter_name  = string
          parameter_value = string
        })), [])
      })), [])
    })), [])
    s3_backup_configuration = optional(list(object({
      bucket_arn          = string
      buffering_interval  = optional(number)
      buffering_size      = optional(number)
      compression_format  = optional(string)
      error_output_prefix = optional(string)
      kms_key_arn         = optional(string)
      prefix              = optional(string)
      role_arn            = string
      cloudwatch_logging_options = optional(list(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      })), [])
    })), [])
    s3_configuration = list(object({
      bucket_arn          = string
      buffering_interval  = optional(number)
      buffering_size      = optional(number)
      compression_format  = optional(string)
      error_output_prefix = optional(string)
      kms_key_arn         = optional(string)
      prefix              = optional(string)
      role_arn            = string
      cloudwatch_logging_option = optional(list(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      })), [])
    }))
    secrets_manager_configuration = optional(list(object({
      enabled    = optional(bool)
      secret_arn = optional(string)
      role_arn   = optional(string)
    })), [])
  }))
  default     = []
}
variable "kinesis_firehose_delivery_stream_server_side_encryption" {
  description = "(Optional) Encrypt at rest options.. Server-side encryption should not be enabled when a kinesis stream is configured as the source of the firehose delivery stream"
  type        = list(object({
    enabled  = optional(bool)
    key_arn  = optional(string)
    key_type = optional(string)
  }))
  default     = []
}
variable "kinesis_firehose_delivery_stream_snowflake_configuration" {
  description = "(Optional) Configuration options when destination is snowflake"
  type        = list(object({
    account_url                = string
    buffering_interval         = optional(number)
    buffering_size             = optional(number)
    content_column_name        = optional(string)
    data_loading_option        = optional(string)
    database                   = string
    key_passphrase             = optional(string)
    metadata_column_name       = optional(string)
    private_key                = optional(string)
    retry_duration             = optional(number)
    role_arn                   = string
    s3_backup_mode             = optional(string)
    schema                     = string
    table                      = string
    user                       = optional(string)
    cloudwatch_logging_options = optional(list(object({
      enabled         = optional(bool)
      log_group_name  = optional(string)
      log_stream_name = optional(string)
    })), [])
    processing_configuration = optional(list(object({
      enabled    = optional(bool)
      processors = optional(list(object({
        type     = string
        parameters = optional(list(object({
          parameter_name  = string
          parameter_value = string
        })), [])
      })), [])
    })), [])
    s3_configuration = list(object({
      bucket_arn          = string
      buffering_interval  = optional(number)
      buffering_size      = optional(number)
      compression_format  = optional(string)
      error_output_prefix = optional(string)
      kms_key_arn         = optional(string)
      prefix              = optional(string)
      role_arn            = string
      cloudwatch_logging_option = optional(list(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      })), [])
    }))
    secrets_manager_configuration = optional(list(object({
      enabled    = optional(bool)
      secret_arn = optional(string)
      role_arn   = optional(string)
    })), [])
    snowflake_role_configuration = optional(list(object({
      enabled        = optional(bool)
      snowflake_role = optional(string)
    })), [])
    snowflake_vpc_configuration  = optional(list(object({
      private_link_vpce_id = string
    })), [])
  }))
  default     = []
} 
variable "kinesis_firehose_delivery_stream_splunk_configuration" {
  description = "(Optional) Configuration options when destination is splunk"
  type        = list(object({
    buffering_interval         = optional(number)
    buffering_size             = optional(number)
    hec_acknowledgment_timeout = optional(number)
    hec_endpoint               = string
    hec_endpoint_type          = optional(string)
    hec_token                  = string
    retry_duration             = optional(number)
    s3_backup_mode             = optional(string)
    cloudwatch_logging_option = optional(list(object({
      enabled         = optional(bool)
      log_group_name  = optional(string)
      log_stream_name = optional(string)
    })), [])
    processing_configuration = optional(list(object({
      enabled    = optional(bool)
      processors = optional(list(object({
        type     = string
        parameters = optional(list(object({
          parameter_name  = string
          parameter_value = string
        })), [])
      })), [])
    })), [])
    s3_configuration = list(object({
      bucket_arn          = string
      buffering_interval  = optional(number)
      buffering_size      = optional(number)
      compression_format  = optional(string)
      error_output_prefix = optional(string)
      kms_key_arn         = optional(string)
      prefix              = optional(string)
      role_arn            = string
      cloudwatch_logging_option = optional(list(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      })), [])
    }))
    secrets_manager_configuration = optional(list(object({
      enabled    = optional(bool)
      secret_arn = optional(string)
      role_arn   = optional(string)
    })), [])
  }))
  default     = []
}
