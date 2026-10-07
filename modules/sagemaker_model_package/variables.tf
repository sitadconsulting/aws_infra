variable "sagemaker_model_package_approval_description" {
  description = "A description provided for the model approval"
  type        = string
  default     = null
}
variable "sagemaker_model_package_certify_for_marketplace" {
  description = "Whether to certify the model package for listing on AWS Marketplace"
  type        = bool
  default     = null
}
variable "sagemaker_model_package_client_token" {
  description = "A unique token that guarantees that the call to this API is idempotent"
  type        = string
  default     = null
}
variable "sagemaker_model_package_customer_metadata_properties" {
  description = "The metadata properties associated with the model package versions"
  type        = map(string)
  default     = null
}
variable "sagemaker_model_package_domain" {
  description = "The machine learning domain of the model package you specified"
  type        = string
  default     = null
}
variable "sagemaker_model_package_model_approval_status" {
  description = "The approval status of the model package"
  type        = string
  default     = null
}
variable "sagemaker_model_package_model_package_description" {
  description = "The description of the model package"
  type        = string
  default     = null
}
variable "sagemaker_model_package_model_package_group_name" {
  description = "The name of the model package group"
  type        = string
  default     = null
}
variable "sagemaker_model_package_model_package_name" {
  description = "The name or arn of the model package"
  type        = string
  default     = null
}
variable "sagemaker_model_package_model_package_version" {
  description = "The version of the model package"
  type        = string
  default     = null
}
variable "sagemaker_model_package_sample_payload_url" {
  description = "The Amazon Simple Storage Service (Amazon S3) path where the sample payload are stored pointing to single gzip compressed tar archive"
  type        = string
  default     = null
}
variable "sagemaker_model_package_skip_model_validation" {
  description = "Indicates if you want to skip model validation"
  type        = string
  default     = null
}
variable "sagemaker_model_package_source_uri" {
  description = "The URI of the source for the model package"
  type        = string
  default     = null
}
variable "sagemaker_model_package_task" {
  description = "The machine learning task your model package accomplishes"
  type        = string
  default     = null
}
variable "sagemaker_model_package_additional_inference_specifications" {
  description = "An array of additional Inference Specification objects"
  type        = list(object({
    description                                 = optional(string)
    name                                        = optional(string)
    supported_content_types                     = optional(list(string))
    supported_realtime_inference_instance_types = optional(list(string))
    supported_response_mime_types               = optional(list(string))
    supported_transform_instance_types          = optional(list(string))
    containers = optional(list(object({
      container_hostname = optional(string)
      environment        = optional(map(string))
      framework          = optional(string)
      framework_version  = optional(string)
      image              = optional(string)
      image_digest       = optional(string)
      model_data_url     = optional(string)
      nearest_model_name = optional(string)
      model_data_source  = optional(object({
        s3_data_source   = optional(object({
          compression_type = optional(string)
          s3_data_type     = optional(string)
          s3_uri           = optional(string)
          model_access_config = optional(object({
            accept_eula = optional(bool)
          }), {})
        }), {})
      }), {})
      model_input = optional(object({
        data_input_config = optional(string)
      }), {})
    })), [])
  }))
  default     = []
}
variable "sagemaker_model_package_additional_inference_specifications_to_add" {
  description = "An array of additional Inference Specification objects"
  type        = list(object({
    description                                 = optional(string)
    name                                        = optional(string)
    supported_content_types                     = optional(list(string))
    supported_realtime_inference_instance_types = optional(list(string))
    supported_response_mime_types               = optional(list(string))
    supported_transform_instance_types          = optional(list(string))
    containers = optional(list(object({
      container_hostname = optional(string)
      environment        = optional(map(string))
      framework          = optional(string)
      framework_version  = optional(string)
      image              = optional(string)
      image_digest       = optional(string)
      model_data_url     = optional(string)
      nearest_model_name = optional(string)
      model_data_source  = optional(object({
        s3_data_source   = optional(object({
          compression_type = optional(string)
          s3_data_type     = optional(string)
          s3_uri           = optional(string)
          model_access_config = optional(object({
            accept_eula = optional(bool)
          }), {})
        }), {})
      }), {})
      model_input = optional(object({
        data_input_config = optional(string)
      }), {})
    })), [])
  }))
  default     = []
}
variable "sagemaker_model_package_drift_check_baselines" {
  description = "Represents the drift check baselines that can be used when the model monitor is set using the model package"
  type        = object({
    bias = optional(object({
      config_file = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
      post_training_constraints = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
      pre_training_constraints = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
    }), {})
    explainability = optional(object({
      config_file = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
      constraints = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
    }), {})
    model_data_quality = optional(object({
      constraints = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
      statistics = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
    }), {})
    model_quality = optional(object({
      constraints = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
      statistics = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
    }), {})
  })
  default     = null
}
variable "sagemaker_model_package_inference_specification" {
  description = "Details about inference jobs that can be run with models based on this model package"
  type        = object({
    supported_content_types                     = optional(list(string))
    supported_realtime_inference_instance_types = optional(list(string))
    supported_response_mime_types               = optional(list(string))
    supported_transform_instance_types          = optional(list(string))
    containers = optional(list(object({
      container_hostname = optional(string)
      environment        = optional(map(string))
      framework          = optional(string)
      framework_version  = optional(string)
      image              = optional(string)
      image_digest       = optional(string)
      model_data_url     = optional(string)
      nearest_model_name = optional(string)
      model_data_source  = optional(object({
        s3_data_source = optional(object({
          compression_type    = optional(string)
          s3_data_type        = optional(string)
          s3_uri              = optional(string)
          model_access_config = optional(object({
            accept_eula = optional(bool)
          }), {})
        }), {})
      }), {})
      model_input = optional(object({
        data_input_config = optional(string)
      }), {})
    })), [])
  })
  default     = null
}
variable "sagemaker_model_package_metadata_properties" {
  description = "Metadata properties of the tracking entity, trial, or trial component"
  type        = object({
    commit_id    = optional(string)
    generated_by = optional(string)
    project_id   = optional(string)
    repository   = optional(string)

  })
  default     = null
}
variable "sagemaker_model_package_model_card" {
  description = "The model card associated with the model package"
  type        = object({
    model_card_content = optional(string)
    model_card_status  = optional(string)
  })
  default     = null
}
variable "sagemaker_model_package_model_metrics" {
  description = "A structure that contains model metrics reports"
  type        = object({
    bias = optional(object({
      post_training_report = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
      pre_training_report  = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
      report      = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
    }), {})
    explainability = optional(object({
      report = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
    }), {})
    model_data_quality = optional(object({
      constraints = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
      statistics  = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
    }), {})
    model_quality = optional(object({
      constraints = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
      statistics = optional(object({
        content_digest = optional(string)
        content_type   = optional(string)
        s3_uri         = optional(string)
      }), {})
    }), {})
  })
  default     = null
}
variable "sagemaker_model_package_model_package_status_details" {
  description = "Details about the current status of the model package"
  type        = object({
    validation_statuses = optional(list(object({
      failure_reason = optional(string)
      name           = optional(string)
      status         = optional(string)
    })), [])
  })
  default     = null
}
variable "sagemaker_model_package_security_config" {
  description = "An optional AWS Key Management Service key to encrypt, decrypt, and re-encrypt model package information for regulated workloads with highl
y sensitive data"
  type        = object({
    kms_key_id = optional(string)
  })
  default     = null
}
variable "sagemaker_model_package_source_algorithm_specification" {
  description = "Details about the algorithm that was used to create the model package"
  type        = object({
    source_algorithms = optional(list(object({
      algorithm_name = optional(string)
      model_data_url = optional(string)
    })), [])
  })
  default     = null
}
variable "sagemaker_model_package_tags" {
  description = "An array of key-value pairs to apply to this resource"
  type        = list(object({
    key   = optional(string)
    value = optional(string)
  }))
  default     = []
}
variable "sagemaker_model_package_validation_specification" {
  description = "Specifies configurations for one or more transform jobs that Amazon SageMaker runs to test the model package"
  type        = object({
    validation_role = optional(string)
    validation_profiles = optional(list(object({
      profile_name             = optional(string)
      transform_job_definition = optional(object({
        batch_strategy            = optional(string)
        environment               = optional(map(string))
        max_concurrent_transforms = optional(number)
        max_payload_in_mb         = optional(number)
        transform_input           = optional(object({
          compression_type = optional(string)
          content_type     = optional(string)
          split_type       = optional(string)
          data_source      = optional(object({
            s3_data_source = optional(object({
              s3_data_type = optional(string)
              s3_uri       = optional(string)
            }), {})
          }), {})
        }), {})
        transform_output = optional(object({
          accept         = optional(string)
          assemble_with  = optional(string)
          kms_key_id     = optional(string)
          s3_output_path = optional(string)
        }), {})
        transform_resources = optional(object({
          instance_count    = optional(number)
          instance_type     = optional(string)
          volume_kms_key_id = optional(string)
        }), {})
      }), {})
    })), [])
  })
  default     = null
}
