variable "sagemaker_model_enable_network_isolation" {
  description = "Isolates the model container. No inbound or outbound network calls can be made to or from the model container"
  type        = bool
  default     = false
}
variable "sagemaker_model_execution_role_arn" {
  description = "A role that SageMaker can assume to access model artifacts and docker images for deployment"
  type        = string
}
variable "sagemaker_model_name" {
  description = "The name of the model (must be unique). If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}
variable "sagemaker_model_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_model_container" {
  description = "Specifies containers in the inference pipeline. If not specified, the primary_container argument is required"
  type        = list(object({
    container_hostname = optional(string)
    environment        = optional(map(string))
    image              = optional(string)
    mode               = optional(string)
    model_data_url     = optional(string)
    model_package_name = optional(string)
    image_config       = optional(list(object({
      repository_access_mode = string
      repository_auth_config = optional(list(object({
        repository_credentials_provider_arn = string
      })), [])
    })), [])
    model_data_source  = optional(list(object({
      s3_data_source  = list(object({
        s3_uri           = string
        s3_data_type     = string
        compression_type = string 
      }))
    })), [])
  }))
  default     = []
}
variable "sagemaker_model_inference_execution_config" {
  description = "Specifies details of how containers in a multi-container endpoint are called"
  type        =  list(object({
    mode = string
  }))
  default     = []
}
variable "sagemaker_model_primary_container" {
  description = "The primary docker image containing inference code that is used when the model is deployed for predictions. If not specified, the container argument is required"
  type        = list(object({
    container_hostname = optional(string)
    environment        = optional(map(string))
    image              = optional(string)
    mode               = optional(string)
    model_data_url     = optional(string)
    model_package_name = optional(string)
    image_config       = optional(list(object({
      repository_access_mode = string
      repository_auth_config = optional(list(object({
        repository_credentials_provider_arn = string
      })), [])
    })), [])
    model_data_source = optional(list(object({
      s3_data_source  = list(object({
        s3_uri           = string
        s3_data_type     = string
        compression_type = string 
      }))
    })), [])
  }))
  default     = []
}
variable "sagemaker_model_vpc_config" {
  description = "Specifies the VPC that you want your model to connect to. VpcConfig is used in hosting services and in batch transform"
  type        = list(object({
    subnets            = list(string)
    security_group_ids = list(string)
  }))
  default     = []
}
