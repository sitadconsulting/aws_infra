variable "sagemaker_space_space_name" {
  description = "The name of the space"
  type        = string
}
variable "sagemaker_space_domain_id" {
  description = "The ID of the associated Domain"
  type        = string
}
variable "sagemaker_space_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_space_space_settings" {
  description = "A collection of space settings"
  type        = list(object({
    jupyter_server_app_settings = optional(list(object({
      lifecycle_config_arns = optional(list(string))
      code_repository = optional(list(object({
        repository_url = string
      })), [])
      default_resource_spec = list(object({
        instance_type               = optional(string)
        lifecycle_config_arn        = optional(string)
        sagemaker_image_arn         = optional(string)
        sagemaker_image_version_arn = optional(string)
      }))
    })), [])
    kernel_gateway_app_settings =  optional(list(object({
      lifecycle_config_arns = optional(list(string))
      default_resource_spec = list(object({
        instance_type               = optional(string)
        lifecycle_config_arn        = optional(string)
        sagemaker_image_arn         = optional(string)
        sagemaker_image_version_arn = optional(string)
      }))
      custom_image = optional(list(object({
        app_image_config_name = string
        image_name            = string
        image_version_number  = optional(number)
      })), [])
    })), [])
  }))
  default     = []
}
