variable "bedrock_data_automation_project_kms_encryption_context" {
  description = "The AWS KMS encryption context to use for encryption"
  type        = map(string)
  default     = null
}
variable "bedrock_data_automation_project_kms_key_id" {
  description = "The AWS KMS key to use for encryption"
  type        = string
  default     = null
}
variable "bedrock_data_automation_project_project_description" {
  description = "The project description"
  type        = string
  default     = null
}
variable "bedrock_data_automation_project_name" {
  description = "The project name"
  type        = string
  default     = null
}
variable "bedrock_data_automation_project_type" {
  description = "The project type, allowed values: ASYNC | SYNC"
  type        = string
  default     = null
}
variable "bedrock_data_automation_project_tags" {
  description = "A map of tags to assign to the project resource"
  type        = list(object({
    key   = optional(string)
    value = optional(string)
  }))
  default     = null
}
variable "bedrock_data_automation_project_custom_output_configuration" {
  description = "Custom output configuration"
  type        = object({
    blueprints = optional(list(object({
      blueprint_arn     = optional(string)
      blueprint_stage   = optional(string)
      blueprint_version = optional(string)
    })), [])
  })
  default = null
}
variable "bedrock_data_automation_project_override_configuration" {
  description = "Override configuration"
  type        = object({
    audio = optional(object({
      language_configuration = optional(object({
        generative_output_language  = optional(string)
        identify_multiple_languages = optional(bool)
        input_languages             = optional(list(string))
      }), {})
      modality_processing = optional(object({
        state = optional(string)
      }), {})
      sensitive_data_configuration = optional(object({
        detection_mode             = optional(string)
        detection_scope            = optional(list(string))
        pii_entities_configuration = optional(object({
          pii_entity_types    = optional(list(string))
          redaction_mask_mode = optional(string)
        }), {})
      }), {})
    }), {})
    document = optional(object({
      modality_processing = optional(object({
        state = optional(string)
      }), {})
      sensitive_data_configuration = optional(object({
        detection_mode             = optional(string)
        detection_scope            = optional(list(string))
        pii_entities_configuration = optional(object({
          pii_entity_types    = optional(list(string))
          redaction_mask_mode = optional(string)
        }), {}) 
      }), {})
      splitter = optional(object({
        state = optional(string)
      }), {})
    }), {})
    image = optional(object({
      modality_processing = optional(object({
        state = optional(string)
      }), {})
      sensitive_data_configuration = optional(object({
        detection_mode             = optional(string)
        detection_scope            = optional(list(string))
        pii_entities_configuration = optional(object({
          pii_entity_types    = optional(list(string))
          redaction_mask_mode = optional(string)
        }), {}) 
      }), {})
    }), {})
    modality_routing = optional(object({
      jpeg = optional(string)
      mov  = optional(string)
      mp_4 = optional(string)
      png  = optional(string)
    }), {})
    video = optional(object({
      modality_processing = optional(object({
        state = optional(string)
      }), {})
      sensitive_data_configuration = optional(object({
        detection_mode             = optional(string)
        detection_scope            = optional(list(string))
        pii_entities_configuration = optional(object({
          pii_entity_types    = optional(list(string))
          redaction_mask_mode = optional(string)
        }), {})
      }), {})
    }), {})
  })
  default = null
}
variable "bedrock_data_automation_project_standard_output_configuration" {
  description = "Standard output configuration"
  type        = object({
    audio = optional(object({
      extraction = optional(object({
        category = optional(object({
          state              = optional(string)
          types              = optional(list(string))
          type_configuration = optional(object({
            transcript = optional(object({
              channel_labeling = optional(object({
                state = optional(string)
              }), {})
              speaker_labeling = optional(object({
                state = optional(string)
              }), {})
            }), {})
          }), {}) 
        }), {})
      }), {})
      generative_field = optional(object({
        state = optional(string)
        types = optional(list(string))
      }), {})
    }), {})
    document = optional(object({
      extraction = optional(object({
        bounding_box = optional(object({
          state = optional(string)
        }), {})
        granularity = optional(object({
          types = optional(list(string))
        }), {})
      }), {})
      generative_field = optional(object({
        state = optional(string)
      }), {})
      output_format = optional(object({
        additional_file_format = optional(object({
          state = optional(string)
        }), {})
        text_format = optional(object({
          types = optional(list(string))
        }), {})
      }), {})
    }), {})
    image = optional(object({
      extraction = optional(object({
        bounding_box = optional(object({
          state = optional(string)
        }), {})
        category = optional(object({
          state = optional(string)
          types = optional(list(string))
        }), {})
      }), {})
      generative_field = optional(object({
        state = optional(string)
        types = optional(list(string))
      }), {})
    }), {})
    video = optional(object({
      extraction = optional(object({
        bounding_box = optional(object({
          state = optional(string)
        }), {})
        category = optional(object({
          state = optional(string)
          types = optional(list(string))
        }), {})
      }), {})
      generative_field = optional(object({
        state = optional(string)
        types = optional(list(string))
      }), {})
    }), {})
  })
  default = null
}
