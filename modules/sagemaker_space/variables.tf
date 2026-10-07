variable "sagemaker_space_space_name" {
  description = "The name of the space"
  type        = string
}
variable "sagemaker_space_domain_id" {
  description = "The ID of the associated Domain"
  type        = string
}
variable "sagemaker_space_space_display_name" {
  description = "The name of the space that appears in the SageMaker Studio UI"
  type        = string
  default     = ""
}
variable "sagemaker_space_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_space_ownership_settings" {
  description = "A collection of ownership settings. Required if space_sharing_settings is set"
  type        = list(object({
    owner_user_profile_name = string
  }))
  deafult = []
}
variable "sagemaker_space_space_settings" {
  description = "A collection of space settings"
  type        = list(object({
    app_type = optional(string)
    code_editor_app_settings = optional(list(object({
      app_lifecycle_management = optional(list(object({
        idle_settings = optional(list(object({
          idle_timeout_in_minutes = optional(number)
        })), [])
      })), [])
      default_resource_spec = optional(list(object({
        instance_type                 = optional(string)
        lifecycle_config_arn          = optional(string)
        sagemaker_image_arn           = optional(string)
        sagemaker_image_version_alias = optional(string)
        sagemaker_image_version_arn   = optional(string)
      })), [])
    })), [])
    custom_file_system = optional(list(object({
      efs_file_system = optional(list(object({
        file_system_id = string
      })), [])
    })), [])
    jupyter_lab_app_settings = optional(list(object({
      app_lifecycle_management = optional(list(object({
        idle_settings = optional(list(object({
          idle_timeout_in_minutes = optional(number)
        })), [])
      })), [])
      code_repository = optional(list(object({
        repository_url = string
      })), [])
      default_resource_spec = optional(list(object({
        instance_type                 = optional(string)
        lifecycle_config_arn          = optional(string)
        sagemaker_image_arn           = optional(string)
        sagemaker_image_version_alias = optional(string)
        sagemaker_image_version_arn   = optional(string)
      })), [])
    })), [])
    jupyter_server_app_settings = optional(list(object({
      lifecycle_config_arns = optional(list(string))
      code_repository = optional(list(object({
        repository_url = string
      })), [])
      default_resource_spec = list(object({
        instance_type                 = optional(string)
        lifecycle_config_arn          = optional(string)
        sagemaker_image_arn           = optional(string)
        sagemaker_image_version_alias = optional(string)
        sagemaker_image_version_arn   = optional(string)
      }))
    })), [])
    kernel_gateway_app_settings =  optional(list(object({
      lifecycle_config_arns = optional(list(string))
      default_resource_spec = list(object({
        instance_type                 = optional(string)
        lifecycle_config_arn          = optional(string)
        sagemaker_image_arn           = optional(string)
        sagemaker_image_version_alias = optional(string)
        sagemaker_image_version_arn   = optional(string)
      }))
      custom_image = optional(list(object({
        app_image_config_name = string
        image_name            = string
        image_version_number  = optional(number)
      })), [])
    })), [])
    space_storage_settings = optional(list(object({
      ebs_storage_settings = optional(list(object({
        ebs_volume_size_in_gb = number
      })), [])
    })), [])
  }))
  default     = []
}
variable "sagemaker_space_space_sharing_settings" {
  description = "A collection of space sharing settings. Required if ownership_settings is set"
  type        = list(object({
    sharing_type = string
  }))
  default = []
}
