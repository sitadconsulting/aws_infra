variable "sagemaker_endpoint_configuration_kms_key_arn" {
  description = "Amazon Resource Name (ARN) of a AWS Key Management Service key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance that hosts the endpoint"
  type        = string
  default     = null
}
variable "sagemaker_endpoint_configuration_name" {
  description = "The name of the endpoint configuration. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix"
  type        = string
  default     = null
}
variable "sagemaker_endpoint_configuration_name_prefix" {
  description = "Creates a unique endpoint configuration name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "sagemaker_endpoint_configuration_tags" {
  description = "A mapping of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_endpoint_configuration_async_inference_config" {
  description = "Specifies configuration for how an endpoint performs asynchronous inference"
  type        = list(object({
    client_config = optional(list(object({
      max_concurrent_invocations_per_instance = optional(number)
    })), [])
    output_config = list(object({
      kms_key_id          = optional(string)
      s3_failure_path     = optional(string)
      s3_output_path      = string
      notification_config = optional(list(object({
        error_topic                   = optional(string)
        include_inference_response_in = optional(list(string)) 
        success_topic                 = optional(string)
      })), [])
    }))
  }))
  default     = []
}
variable "sagemaker_endpoint_configuration_data_capture_config" {
  description = "Specifies the parameters to capture input/output of SageMaker models endpoints"
  type        = list(object({
    destination_s3_uri          = string
    enable_capture              = optional(bool)
    initial_sampling_percentage = number
    kms_key_id                  = optional(string)
    capture_content_type_header = optional(list(object({
      csv_content_types  = optional(list(string))
      json_content_types = optional(list(string))
    })), [])
    capture_options             = list(object({
      capture_mode = string
    }))
  }))
  default     = []
}
variable "sagemaker_endpoint_configuration_production_variants" {
  description = "An list of ProductionVariant objects, one for each model that you want to host at this endpoint"
  type        = list(object({
    accelerator_type                                  = optional(string)
    container_startup_health_check_timeout_in_seconds = optional(number)
    enable_ssm_access                                 = optional(bool)
    initial_instance_count                            = optional(number)
    initial_variant_weight                            = optional(number)
    instance_type                                     = optional(string)
    model_data_download_timeout_in_seconds            = optional(number)
    model_name                                        = string
    variant_name                                      = optional(string)
    volume_size_in_gb                                 = optional(number)
    core_dump_config                                  = optional(list(object({
      destination_s3_uri = string
      kms_key_id         = optional(string)
    })), [])
    serverless_config                                 = optional(list(object({
      max_concurrency         = number
      memory_size_in_mb       = number
      provisioned_concurrency = optional(number) 
    })), [])
  }))
}
variable "sagemaker_endpoint_configuration_shadow_production_variants" {
  description = "Array of ProductionVariant objects. There is one for each model that you want to host at this endpoint in shadow mode with production traffic replicated from the model specified on ProductionVariants.If you use this field, you can only specify one variant for ProductionVariants and one variant for ShadowProductionVariants"
  type        = list(object({
    accelerator_type                                  = optional(string)
    container_startup_health_check_timeout_in_seconds = optional(number)
    enable_ssm_access                                 = optional(bool)
    initial_instance_count                            = optional(number)
    initial_variant_weight                            = optional(number)
    instance_type                                     = optional(string)
    model_data_download_timeout_in_seconds            = optional(number)
    model_name                                        = string
    variant_name                                      = optional(string)
    volume_size_in_gb                                 = optional(number)
    core_dump_config                                  = optional(list(object({
      destination_s3_uri = string
      kms_key_id         = optional(string)
    })), [])
    serverless_config                                 = optional(list(object({
      max_concurrency         = number
      memory_size_in_mb       = number
      provisioned_concurrency = optional(number) 
    })), [])
  }))
  default     = []
}
