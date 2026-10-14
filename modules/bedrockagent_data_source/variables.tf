variable "bedrockagent_data_source_data_deletion_policy" {
  description = "(Optional) Data deletion policy for a data source. Valid values: RETAIN, DELETE"
  type        = string
  default     = null
}
variable "bedrockagent_data_source_description" {
  description = "(Optional) Description of the data source"
  type        = string
  default     = ""
}
variable "bedrockagent_data_source_knowledge_base_id" {
  description = "(Required) Unique identifier of the knowledge base to which the data source belongs"
  type        = string
}
variable "bedrockagent_data_source_name" {
  description = "(Required, Forces new resource) Name of the data source"
  type        = string
}
variable "bedrockagent_data_source_data_source_configuration" {
  description = "(Required) Details about how the data source is stored"
  type        = list(object({
    type             = string
    confluence_configuration = optional(list(object({
      crawler_configuration = optional(list(object({
        filter_configuration = optional(list(object({
          type = string
          pattern_object_filter = optional(list(object({
            filters = list(object({
              exclusion_filters = optional(list(string))
              inclusion_filters = optional(list(string))
              object_type       = string
            }))
          })), [])
        })), [])
      })), [])
      source_configuration = list(object({
        auth_type              = string
        credentials_secret_arn = string
        host_type              = string
        host_url               = string
      }))
    })), []) 
    managed_knowledge_base_connector_configuration = optional(list(object({
      connector_parameters              = optional(string)
      deletion_protection_configuration = optional(list(object({
        deletion_protection_status    = string
        deletion_protection_threshold = optional(number)
      })), [])
      media_extraction_configuration    = optional(list(object({
        audio_extraction_configuration = optional(list(object({
          audio_extraction_status = string
        })), [])
        image_extraction_configuration = optional(list(object({
          image_extraction_status = string
        })), [])
        video_extraction_configuration = optional(list(object({
          video_extraction_status = string
        })), [])
      })), [])
    })), [])
    s3_configuration         = optional(list(object({
      bucket_arn               = string
      bucket_owner_account_id  = optional(string)
      inclusion_prefixes       = optional(list(string))
    })), [])
    salesforce_configuration = optional(list(object({
      crawler_configuration = optional(list(object({
        filter_configuration = optional(list(object({
          type = string
          pattern_object_filter = optional(list(object({
            filters = list(object({
              exclusion_filters = optional(list(string))
              inclusion_filters = optional(list(string))
              object_type       = string
            }))
          })), [])
        })), [])
      })), [])
      source_configuration = list(object({
        auth_type              = string
        credentials_secret_arn = string
        host_url               = string
      }))
    })), []) 
    share_point_configuration = optional(list(object({
      crawler_configuration = optional(list(object({
        filter_configuration = optional(list(object({
          type = string
          pattern_object_filter = optional(list(object({
            filters = list(object({
              exclusion_filters = optional(list(string))
              inclusion_filters = optional(list(string))
              object_type       = string
            }))
          })), [])
        })), [])
      })), [])
      source_configuration = list(object({
        auth_type              = string
        credentials_secret_arn = string
        domain                 = string
        host_url               = string
        site_urls              = list(string)
        tenant_id              = optional(string)
      }))
    })), [])
    web_configuration = optional(list(object({
      crawler_configuration = optional(list(object({
        exclusion_filters = optional(list(string))
        inclusion_filters = optional(list(string))
        scope             = optional(string)
        user_agent        = optional(string)
        crawler_limits    = optional(list(object({
          max_pages  = optional(number)
          rate_limit = optional(number)
        })), [])
      })), [])
      source_configuration = list(object({
        url_configuration = list(object({
          seed_urls = optional(list(object({
            url = optional(string)
          })), [])
        }))
      }))
    })), [])
  }))
}
variable "bedrockagent_data_source_server_side_encryption_configuration" {
  description = "(Optional) Details about the configuration of the server-side encryption"
  type        = list(object({
    kms_key_arn = optional(string)
  }))
  default     = []
}
variable "bedrockagent_data_source_vector_ingestion_configuration" {
  description = "(Optional, Forces new resource) Details about the configuration of the vector ingestion configuration"
  type        = list(object({
    chunking_configuration = optional(list(object({
      chunking_strategy                 = string
      fixed_size_chunking_configuration = optional(list(object({
        max_tokens         = number
        overlap_percentage = optional(number)
      })), []) 
      hierarchical_chunking_configuration = optional(list(object({
        overlap_tokens      = number
        level_configuration = list(object({
          max_tokens = number
        }))
      })), [])
      semantic_chunking_configuration = optional(list(object({
        breakpoint_percentile_threshold = number
        buffer_size                     = number
        max_token                       = number
      })), [])
    })))
    custom_transformation_configuration = optional(list(object({
      intermediate_storage = list(object({
        s3_location = list(object({
          uri = string
        }))
      }))
      transformation = list(object({
        step_to_apply           = string
        transformation_function = list(object({
          transformation_lambda_configuration = list(object({
            lambda_arn = string
          }))
        })) 
      }))
    })), [])
    parsing_configuration = optional(list(object({
      parsing_strategy                       = string
      bedrock_data_automation_configuration = optional(list(object({
        parsing_modality = optional(string)
      })), [])
      bedrock_foundation_model_configuration = optional(list(object({
        model_arn        = string
        parsing_modality = optional(string)
        parsing_prompt = optional(list(object({
          parsing_prompt_string = string
        })), [])
      })), [])
    })), [])
  }))
  default     = []
}
