variable "sagemaker_user_profile_domain_id" {
  description = "The ID of the associated Domain"
  type        = string
}
variable "sagemaker_user_profile_user_profile_name" {
  description = "The name for the User Profile"
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
    auto_mount_home_efs = optional(string) 
    default_landing_uri = optional(string)
    execution_role      = string
    security_groups     = optional(list(string))
    studio_web_portal   = optional(string)
    canvas_app_settings = optional(list(object({
      direct_deploy_settings = optional(list(object({
        status = optional(string)
      })), [])
      emr_serverless_settings = optional(list(object({
        execution_role_arn = optional(string)
        status             = optional(string)
      })), [])
      generative_ai_settings = optional(list(object({
        amazon_bedrock_role_arn = optional(string)
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
    code_editor_app_settings = optional(list(object({
      built_in_lifecycle_config_arn = optional(string)
      lifecycle_config_arns         = optional(list(string))
      app_lifecycle_management = optional(list(object({
        idle_settings = optional(list(object({
          idle_timeout_in_minutes     = optional(number)
          lifecycle_management        = optional(string)
          max_idle_timeout_in_minutes = optional(number)
          min_idle_timeout_in_minutes = optional(number)
        })), [])
      })), [])
      default_resource_spec = optional(list(object({
        instance_type                 = optional(string)
        lifecycle_config_arn          = optional(string)
        sagemaker_image_arn           = optional(string)
        sagemaker_image_version_alias = optional(string) 
        sagemaker_image_version_arn   = optional(string) 
      })), [])
      custom_image = optional(list(object({
        app_image_config_name = string
        image_name            = string
        image_version_number  = optional(number)
      })), [])
    })), [])
    custom_file_system_config = optional(list(object({
      efs_file_system_config = optional(list(object({
        file_system_id   = string
        file_system_path = optional(string) 
      })), [])
    })), [])
    custom_posix_user_config = optional(list(object({
      gid = number
      uid = number
    })), [])
    jupyter_lab_app_settings = optional(list(object({
      built_in_lifecycle_config_arn = optional(string)
      lifecycle_config_arns         = optional(list(string))
      app_lifecycle_management = optional(list(object({
        idle_settings = optional(list(object({
          idle_timeout_in_minutes     = optional(number)
          lifecycle_management        = optional(string)
          max_idle_timeout_in_minutes = optional(number)
          min_idle_timeout_in_minutes = optional(number)
        })), [])
      })), [])
      code_repository = optional(list(object({
        repository_url = string
      })), [])
      custom_image = optional(list(object({
        app_image_config_name = string
        image_name            = string
        image_version_number  = optional(number)
      })), [])
      default_resource_spec = optional(list(object({
        instance_type                 = optional(string)
        lifecycle_config_arn          = optional(string)
        sagemaker_image_arn           = optional(string)
        sagemaker_image_version_alias = optional(string) 
        sagemaker_image_version_arn   = optional(string) 
      })), [])
      emr_settings = optional(list(object({
        assumable_role_arns = optional(list(string))
        execution_role_arns = optional(list(string))
      })), [])
    })), [])
    jupyter_server_app_settings = optional(list(object({
      lifecycle_config_arns = optional(list(string))
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
    kernel_gateway_app_settings = optional(list(object({
      lifecycle_config_arns = optional(list(string))
      default_resource_spec = optional(list(object({
        instance_type                 = optional(string)
        lifecycle_config_arn          = optional(string)
        sagemaker_image_arn           = optional(string)
        sagemaker_image_version_alias = optional(string) 
        sagemaker_image_version_arn   = optional(string) 
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
        instance_type                 = optional(string)
        lifecycle_config_arn          = optional(string)
        sagemaker_image_arn           = optional(string)
        sagemaker_image_version_alias = optional(string) 
        sagemaker_image_version_arn   = optional(string) 
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
    space_storage_settings = optional(list(object({
      default_ebs_storage_settings = optional(list(object({
        default_ebs_volume_size_in_gb = number
        maximum_ebs_volume_size_in_gb = number
      })), [])
    })), [])
    studio_web_portal_settings = optional(list(object({
      hidden_app_types      = optional(list(string)) 
      hidden_instance_types = optional(list(string))
      hidden_ml_tools       = optional(list(string))
    })), [])
    tensor_board_app_settings = optional(list(object({
      default_resource_spec = list(object({
        instance_type                 = optional(string)
        lifecycle_config_arn          = optional(string)
        sagemaker_image_arn           = optional(string)
        sagemaker_image_version_alias = optional(string) 
        sagemaker_image_version_arn   = optional(string) 
      }))
    })), [])
  }))
  default     = []
}
