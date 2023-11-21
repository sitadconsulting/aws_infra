variable "sagemaker_domain_app_network_access_type" {
  description = "Specifies the VPC used for non-EFS traffic. The default value is PublicInternetOnly. Valid values are PublicInternetOnly and VpcOnly"
  type        = string
  default     = null
}
variable "sagemaker_domain_app_security_group_management" {
  description = "The entity that creates and manages the required security groups for inter-app communication in VPCOnly mode. Valid values are Service and Customer"
  type        = string
  default     = null
}
variable "sagemaker_domain_auth_mode" {
  description = "The mode of authentication that members use to access the domain. Valid values are IAM and SSO"
  type        = string
}
variable "sagemaker_domain_domain_name" {
  description = "Domain name"
  type        = string
}
variable "sagemaker_domain_kms_key_id" {
  description = "The AWS KMS customer managed CMK used to encrypt the EFS volume attached to the domain"
  type        = string
  default     = null
}
variable "sagemaker_domain_subnet_ids" {
  description = "The VPC subnets that Studio uses for communication"
  type        = string
}
variable "sagemaker_domain_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_domain_vpc_id" {
  description = "The ID of the Amazon Virtual Private Cloud (VPC) that Studio uses for communication"
  type        = string
}
variable "sagemaker_domain_default_space_settings" {
  description = "The default space settings"
  type        = list(object({
    execution_role  = string
    security_groups = optional(list(string))
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
      custom_image          = optional(list(object({
        app_image_config_name = string
        image_name            = string
        image_version_number  = optional(number)
      })), [])
    })), [])
  }))
  default     = []
}
variable "sagemaker_domain_default_user_settings" {
  description = "The default user settings"
  type        = list(object({
    execution_role      = string
    security_groups     = optional(list(string))
    canvas_app_settings = optional(list(object({
      direct_deploy_settings           = optional(list(object({
        status = optional(string)
      })), [])
      identity_provider_oauth_settings = optional(list(object({
        data_source_name = optional(string)
        secret_arn       = string
        status           = optional(string)
      })), []) 
      kendra_settings                  = optional(list(object({
        status = optional(string)
      })), [])
      model_register_settings          = optional(list(object({
        cross_account_model_register_role_arn = optional(string)
        status                                = optional(string)
      })), [])
      time_series_forecasting_settings = optional(list(object({
        amazon_forecast_role_arn = optional(string)
        status                   = optional(string)
      })), [])
      workspace_settings               = optional(list(object({
        s3_artifact_path = optional(string)
        s3_kms_key_id    = optional(string)
      })), [])
    })), [])
    jupyter_server_app_settings  = optional(list(object({
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
      custom_image          = optional(list(object({
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
      custom_image          = optional(list(object({
        app_image_config_name = string
        image_name            = string
        image_version_number  = optional(number)
      })), [])
    })), [])
    sharing_settings      = optional(list(object({
      notebook_output_option = optional(string)
      s3_kms_key_id          = optional(string)
      s3_output_path         = optional(string)
    })), [])
    tensor_board_app_settings = optional(list(object({
      default_resource_spec = optional(list(object({
        instance_type               = optional(string)
        lifecycle_config_arn        = optional(string)
        sagemaker_image_arn         = optional(string)
        sagemaker_image_version_arn = optional(string) 
      })), [])
    })), [])
  }))
}
variable "sagemaker_domain_domain_settings" {
  description = "The domain settings"
  type        = list(object({
    execution_role_identity_config      = optional(string)
    security_group_ids                  = optional(list(string))
    r_studio_server_pro_domain_settings = optional(list(object({
      domain_execution_role_arn    = string
      r_studio_connect_url         = optional(string)
      r_studio_package_manager_url = optional(string)
      default_resource_spec = optional(list(object({
        instance_type               = optional(string)
        lifecycle_config_arn        = optional(string)
        sagemaker_image_arn         = optional(string)
        sagemaker_image_version_arn = optional(string) 
      })), [])
    })), [])
  }))
  default     = []
}
variable "sagemaker_domain_retention_policy" {
  description = "The retention policy for this domain, which specifies whether resources will be retained after the Domain is deleted. By default, all resources are retained"
  type        = list(object({
    home_efs_file_system = optional(string)
  }))
  default     = []
}
