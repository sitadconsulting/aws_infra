resource "aws_sagemaker_user_profile" "sagemaker_user_profile" {
  user_profile_name              = var.sagemaker_user_profile_user_profile_name
  domain_id                      = var.sagemaker_user_profile_domain_id
  single_sign_on_user_identifier = var.sagemaker_user_profile_single_sign_on_user_identifier
  single_sign_on_user_value      = var.sagemaker_user_profile_single_sign_on_user_value
  tags                           = var.sagemaker_user_profile_tags
  
  dynamic "user_settings" {
    for_each = var.sagemaker_user_profile_user_settings
      content {
        execution_role  = user_settings.value["execution_role"]
        security_groups = user_settings.value["security_groups"]
        dynamic "canvas_app_settings" {
          for_each = user_settings.value.canvas_app_settings
            content {
              dynamic "direct_deploy_settings" {
                for_each = canvas_app_settings.value.direct_deploy_settings
                  content {
                    status = direct_deploy_settings.value["status"]
                  }
              }
              dynamic "identity_provider_oauth_settings" {
                for_each = canvas_app_settings.value.identity_provider_oauth_settings
                  content {
                    data_source_name = identity_provider_oauth_settings.value["data_source_name"]
                    secret_arn       = identity_provider_oauth_settings.value["secret_arn"]
                    status           = identity_provider_oauth_settings.value["status"]
                  }
              }
              dynamic "kendra_settings" {
                for_each = canvas_app_settings.value.kendra_settings
                  content {
                    status = kendra_settings.value["status"]
                  }
              }
              dynamic "model_register_settings" {
                for_each = canvas_app_settings.value.model_register_settings
                  content {
                    cross_account_model_register_role_arn = model_register_settings.value["cross_account_model_register_role_arn"]
                    status                                = model_register_settings.value["status"]
                  }
              }
              dynamic "time_series_forecasting_settings" {
                for_each = canvas_app_settings.value.time_series_forecasting_settings
                  content {
                    amazon_forecast_role_arn = time_series_forecasting_settings.value["amazon_forecast_role_arn"]
                    status                   = time_series_forecasting_settings.value["status"]
                  }
              }
              dynamic "workspace_settings" {
                for_each = canvas_app_settings.value.workspace_settings
                  content {
                    s3_artifact_path = workspace_settings.value["s3_artifact_path"]
                    s3_kms_key_id    = workspace_settings.value["s3_kms_key_id"]
                  }
              }
            }
        }
        dynamic "jupyter_server_app_settings" {
          for_each = user_settings.value.jupyter_server_app_settings
            content {
              lifecycle_config_arns = jupyter_server_app_settings.value["lifecycle_config_arns"]
              dynamic "code_repository" {
                for_each = jupyter_server_app_settings.value.code_repository
                  content {
                    repository_url = code_repository.value["repository_url"]
                  }
              }
              dynamic "default_resource_spec" {
                for_each = jupyter_server_app_settings.value.default_resource_spec
                  content {
                    instance_type               = default_resource_spec.value["instance_type"]
                    lifecycle_config_arn        = default_resource_spec.value["lifecycle_config_arn"]
                    sagemaker_image_arn         = default_resource_spec.value["sagemaker_image_arn"]
                    sagemaker_image_version_arn = default_resource_spec.value["sagemaker_image_version_arn"]
                  }
              }
            }
        }
        dynamic "kernel_gateway_app_settings" {
          for_each = user_settings.value.kernel_gateway_app_settings
            content {
              lifecycle_config_arns = kernel_gateway_app_settings.value["lifecycle_config_arns"]
              dynamic "default_resource_spec" {
                for_each = kernel_gateway_app_settings.value.default_resource_spec
                  content {
                    instance_type               = default_resource_spec.value["instance_type"]
                    lifecycle_config_arn        = default_resource_spec.value["lifecycle_config_arn"]
                    sagemaker_image_arn         = default_resource_spec.value["sagemaker_image_arn"]
                    sagemaker_image_version_arn = default_resource_spec.value["sagemaker_image_version_arn"]
                  }
              }
              dynamic "custom_image" {
                for_each = kernel_gateway_app_settings.value.custom_image
                  content {
                    app_image_config_name = custom_image.value["app_image_config_name"]
                    image_name            = custom_image.value["image_name"]
                    image_version_number  = custom_image.value["image_version_number"]
                  }
              }
            }
        }
        dynamic "r_studio_server_pro_app_settings" {
          for_each = user_settings.value.r_studio_server_pro_app_settings
            content {
              access_status = r_studio_server_pro_app_settings.value["access_status"]
              user_group    = r_studio_server_pro_app_settings.value["user_group"]
            }
        }
        dynamic "r_session_app_settings" {
          for_each = user_settings.value.r_session_app_settings
            content {
              dynamic "default_resource_spec" {
                for_each = r_session_app_settings.value.default_resource_spec
                  content {
                    instance_type               = default_resource_spec.value["instance_type"]
                    lifecycle_config_arn        = default_resource_spec.value["lifecycle_config_arn"]
                    sagemaker_image_arn         = default_resource_spec.value["sagemaker_image_arn"]
                    sagemaker_image_version_arn = default_resource_spec.value["sagemaker_image_version_arn"]
                  }
              }
              dynamic "custom_image" {
                for_each = r_session_app_settings.value.custom_image
                  content {
                    app_image_config_name = custom_image.value["app_image_config_name"]
                    image_name            = custom_image.value["image_name"]
                    image_version_number  = custom_image.value["image_version_number"]
                  }
              }
            }
        }
        dynamic "sharing_settings" {
          for_each = user_settings.value.sharing_settings
            content {
              notebook_output_option = sharing_settings.value["notebook_output_option"]
              s3_kms_key_id          = sharing_settings.value["s3_kms_key_id"]
              s3_output_path         = sharing_settings.value["s3_output_path"]
            }
        }
        dynamic "tensor_board_app_settings" {
          for_each = user_settings.value.tensor_board_app_settings
            content {
              dynamic "default_resource_spec" {
                for_each = tensor_board_app_settings.value.default_resource_spec
                  content {
                    instance_type               = default_resource_spec.value["instance_type"]
                    lifecycle_config_arn        = default_resource_spec.value["lifecycle_config_arn"]
                    sagemaker_image_arn         = default_resource_spec.value["sagemaker_image_arn"]
                    sagemaker_image_version_arn = default_resource_spec.value["sagemaker_image_version_arn"]
                  }
              }
            }
        }
      }
  }
}
