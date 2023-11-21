variable "sagemaker_user_profile_user_profile_name" {
  description = "The name for the User Profile"
  type        = string
}
variable "sagemaker_user_profile_domain_id" {
  description = "The ID of the associated Domain"
  type        = string
}
variable "sagemaker_user_profile_single_sign_on_user_identifier" {
  description = "A specifier for the type of value specified in single_sign_on_user_value. Currently, the only supported value is UserName. If the Domain's AuthMode is SSO, this field is required. If the Domain's AuthMode is not SSO, this field cannot be specified"
  type        = string
  default     = null
}
variable "sagemaker_user_profile_single_sign_on_user_value" {
  description = "The username of the associated AWS Single Sign-On User for this User Profile. If the Domain's AuthMode is SSO, this field is required, and must match a valid username of a user in your directory. If the Domain's AuthMode is not SSO, this field cannot be specified"
  type        = string
}
variable "sagemaker_user_profile_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_user_profile_user_settings" {
  description = "The user settings"
  type        = list(object({
    execution_role  = string
    security_groups = optional(list(string))
    canvas_app_settings = optional(list(object({
      direct_deploy_settings = optional(list(object({
        status = optional(string)
      })), [])
      identity_provider_oauth_settings = optional(list(object({
        data_source_name = optional(string)
        secret_arn       = string
        status           = optional(string)
      })), [])
      kendra_settings = optional(list(object({
        status = optional(string)
      })), [])
      model_register_settings = optional(list(object({
        cross_account_model_register_role_arn = optional(string)
        status                                = optional(string)
      })), [])
      time_series_forecasting_settings = optional(list(object({
        amazon_forecast_role_arn = optional(string)
        status                   = optional(string)
      })), [])
      workspace_settings  = optional(list(object({
        s3_artifact_path = optional(string)
        s3_kms_key_id    = optional(string)
      })), [])
    })), [])
    jupyter_server_app_settings = optional(list(object({
      lifecycle_config_arns = optional(list(string))
      code_repository = optional(list(object({
        repository_url = string
      })), [])
      default_resource_spec = optional(list(object({
        instance_type               = optional(string)
        lifecycle_config_arn        = optional(string)
        sagemaker_image_arn         = optional(string)
        sagemaker_image_version_arn = optional(string) 
      })), [])
    })), [])
    kernel_gateway_app_settings = optional(list(object({
      lifecycle_config_arns = optional(list(string))
      default_resource_spec = optional(list(object({
        instance_type               = optional(string)
        lifecycle_config_arn        = optional(string)
        sagemaker_image_arn         = optional(string)
        sagemaker_image_version_arn = optional(string) 
      })), [])
      custom_image = optional(list(object({
        app_image_config_name = string
        image_name            = string
        image_version_number  = optional(number)
      })), [])
    })), [])
    r_studio_server_pro_app_settings = optional(list(object({
      access_status = optional(string)
      user_group    = optional(string)
    })), [])
    r_session_app_settings = optional(list(object({
      default_resource_spec = optional(list(object({
        instance_type               = optional(string)
        lifecycle_config_arn        = optional(string)
        sagemaker_image_arn         = optional(string)
        sagemaker_image_version_arn = optional(string) 
      })), [])
      custom_image = optional(list(object({
        app_image_config_name = string
        image_name            = string
        image_version_number  = optional(number)
      })), [])
    })), [])
    sharing_settings = optional(list(object({
      notebook_output_option = optional(string)
      s3_kms_key_id          = optional(string)
      s3_output_path         = optional(string)
    })), [])
    tensor_board_app_settings = optional(list(object({
      default_resource_spec = list(object({
        instance_type               = optional(string)
        lifecycle_config_arn        = optional(string)
        sagemaker_image_arn         = optional(string)
        sagemaker_image_version_arn = optional(string) 
      }))
    })), [])
  }))
  default     = []
}
