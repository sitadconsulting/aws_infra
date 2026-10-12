variable "sagemaker_processing_job_environment" {
  description = "Sets the environment variables in the Docker container"
  type        = map(string)
  default     = null
}
variable "sagemaker_processing_job_processing_job_name" {
  description = "The name of the processing job. The name must be unique within an AWS Region in the AWS account"
  type        = string
  default     = null
}
variable "sagemaker_processing_job_role_arn" {
  description = "The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker can assume to perform tasks on your behalf"
  type        = string
  default     = null
}
variable "sagemaker_processing_job_app_specification" {
  description = "Configures the processing job to run a specified Docker container image"
  type        = object({
    container_arguments  = optional(list(string))
    container_entrypoint = optional(list(string))
    image_uri            = string
  })
  default     = null
}
variable "sagemaker_processing_job_experiment_config" {
  description = "Associates a SageMaker job as a trial component with an experiment and trial"
  type        = object({
    experiment_name              = optional(string)
    run_name                     = optional(string)
    trial_component_display_name = optional(string)
    trial_name                   = optional(string)
  })
  default     = null
}
variable "sagemaker_processing_job_network_config" {
  description = "Networking options for a job, such as network traffic encryption between containers, whether to allow inbound and outbound network calls to and from containers, and the VPC subnets and security groups to use for VPC-enabled jobs"
  type        = object({
    enable_inter_container_traffic_encryption = optional(bool)
    enable_network_isolation                  = optional(bool)
    vpc_config                                = optional(object({
      security_group_ids = optional(list(string))
      subnets            = optional(list(string))
    }), {})
  })
  default     = null
}
variable "sagemaker_processing_job_processing_inputs" {
  description = "An array of inputs configuring the data to download into the processing container"
  type        = list(object({
    app_managed = optional(bool)
    input_name  = optional(string)
    dataset_definition = optional(object({
      data_distribution_type = optional(string)
      input_mode             = optional(string)
      local_path             = optional(string)
      athena_dataset_definition = optional(object({
        catalog            = optional(string)
        database           = optional(string)
        kms_key_id         = optional(string)
        output_compression = optional(string)
        output_format      = optional(string)
        output_s3_uri      = optional(string)
        query_string       = optional(string)
        work_group         = optional(string)
      }), {})
      redshift_dataset_definition = optional(object({
        cluster_id         = optional(string)
        cluster_role_arn   = optional(string)
        database           = optional(string)
        db_user            = optional(string)
        kms_key_id         = optional(string)
        output_compression = optional(string)
        output_format      = optional(string)
        output_s3_uri      = optional(string)
        query_string       = optional(string)
      }), {})
    }), {})
    s3_input = optional(object({
      local_path                = optional(string)
      s3_compression_type       = optional(string)
      s3_data_distribution_type = optional(string)
      s3_data_type              = optional(string)
      s3_input_mode             = optional(string)
      s3_uri                    = optional(string)
    }), {})
  }))
  default     = []
}
variable "sagemaker_processing_job_processing_output_config" {
  description = "Configuration for uploading output from the processing container"
  type        = object({
    kms_key_id = optional(string)
    outputs    = optional(list(object({
      app_managed  = optional(bool)
      output_name  = optional(string)   
      feature_store_output = optional(object({
        feature_group_name = optional(string)
      }), {}) 
      s3_output = optional(object({
        local_path     = optional(string)
        s3_upload_mode = optional(string)
        s3_uri         = optional(string)
      }), {})
    })), [])
  })
  default     = null
}
variable "sagemaker_processing_job_processing_resources" {
  description = "Identifies the resources, ML compute instances, and ML storage volumes to deploy for a processing job. In distributed training, you specify more than one instance"
  type        = object({
    cluster_config = object({
      instance_count    = number
      instance_type     = string
      volume_kms_key_id = optional(string)
      volume_size_in_gb = number
    })
  })
}
variable "sagemaker_processing_job_stopping_condition" {
  description = "Configures conditions under which the processing job should be stopped, such as how long the processing job has been running. After the condition is met, the processing job is stopped"
  type        = object({
    max_runtime_in_seconds = optional(number)
  })
  default     = null
}
variable "sagemaker_processing_job_tags" {
  description = "(Optional) An array of key-value pairs"
  type        = list(object({
    key   = optional(string)
    value = optional(string) 
  }))
  default     = []
}
