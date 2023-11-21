variable "sagemaker_data_quality_job_definition_name" {
  description = "The name of the data quality job definition. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}
variable "sagemaker_data_quality_job_definition_role_arn" {
  description = "The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker can assume to perform tasks on your behalf"
  type        = string
}
variable "sagemaker_data_quality_job_definition_tags" {
  description = "A mapping of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_data_quality_job_definition_data_quality_app_specification" {
  description = "Specifies the container that runs the monitoring job"
  type        = list(object({
    environment                         = optional(map(string))
    image_uri                           = string
    post_analytics_processor_source_uri = optional(string)
    record_preprocessor_source_uri      = optional(string)
  }))
}
variable "sagemaker_data_quality_job_definition_data_quality_baseline_config" {
  description = "Configures the constraints and baselines for the monitoring job"
  type        = list(object({
    constraints_resource = optional(list(object({
      s3_uri = optional(string)
    })), [])
    statistics_resource  = optional(list(object({
       s3_uri = optional(string)
    })), [])
  }))
  default     = []
}
variable "sagemaker_data_quality_job_definition_data_quality_job_input" {
  description = "A list of inputs for the monitoring job"
  type        = list(object({
    batch_transform_input = optional(list(object({
      data_captured_destination_s3_uri = string
      local_path                       = optional(string)
      s3_data_distribution_type        = optional(string)
      s3_input_mode                    = optional(string)
      dataset_format                   = list(object({
        csv  = optional(list(object({
          header = optional(bool)
        })), [])
        json = optional(list(object({
          line = optional(bool)
        })), [])
      }))
    })), [])
    endpoint_input       = optional(list(object({
      endpoint_name             = string
      local_path                = optional(string)
      s3_data_distribution_type = optional(string)
      s3_input_mode             = optional(string)
    })), [])
  }))
}
variable "sagemaker_data_quality_job_definition_data_quality_job_output_config" {
  description = "The output configuration for monitoring jobs"
  type        = list(object({
    kms_key_id         = optional(string)
    monitoring_outputs = list(object({
      s3_output = list(object({
        local_path     = optional(string)
        s3_upload_mode = optional(string)
        s3_uri         = string
      }))
    }))
  }))
}
variable "sagemaker_data_quality_job_definition_job_resources" {
  description = "Identifies the resources to deploy for a monitoring job"
  type        = list(object({
    cluster_config = list(object({
      instance_count    = number
      instance_type     = string
      volume_kms_key_id = optional(string)
      volume_size_in_gb = number
    }))
  }))
}
variable "sagemaker_data_quality_job_definition_network_config" {
  description = "Specifies networking configuration for the monitoring job"
  type        = list(object({
    enable_inter_container_traffic_encryption = optional(bool)
    enable_network_isolation                  = optional(bool)
    vpc_config                                = optional(list(object({
      security_group_ids = list(string)
      subnets            = list(string)
    })), [])
  }))
  default     = []
}
variable "sagemaker_data_quality_job_definition_stopping_condition" {
  description = "A time limit for how long the monitoring job is allowed to run before stopping"
  type        = list(object({
    max_runtime_in_seconds = optional(number)
  }))
  default     = []
}
