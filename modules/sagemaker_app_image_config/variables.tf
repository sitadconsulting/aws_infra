variable "sagemaker_app_image_config_app_image_config_name" {
  description = "The name of the App Image Config"
  type        = string
}
variable "sagemaker_app_image_config_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_app_image_config_kernel_gateway_image_config" {
  description = "The configuration for the file system and kernels in a SageMaker image running as a KernelGateway app"
  type        = list(object({
    file_system_config = optional(list(object({
       default_gid = optional(number)
       default_uid = optional(number)
       mount_path  = optional(string)
    })), [])
    kernel_spec        = list(object({
      display_name = optional(string)
      name         = string
    }))
  }))
  default     = []
}
