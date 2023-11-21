resource "aws_sagemaker_model" "sagemaker_model" {
  enable_network_isolation   = var.sagemaker_model_enable_network_isolation
  execution_role_arn         = var.sagemaker_model_execution_role_arn
  name                       = var.sagemaker_model_name
  tags                       = var.sagemaker_model_tags

  dynamic "container" {
    for_each = var.sagemaker_model_container
      content {
        container_hostname = container.value["container_hostname"]
        environment        = container.value["environment"]
        image              = container.value["image"]
        mode               = container.value["mode"]
        model_data_url     = container.value["model_data_url"]
        model_package_name = container.value["model_package_name"]
        dynamic "image_config" {
          for_each = container.value.image_config
            content {
              repository_access_mode = image_config.value["repository_access_mode"]
              dynamic "repository_auth_config" {
                for_each = image_config.value.repository_auth_config
                  content {
                    repository_credentials_provider_arn = repository_auth_config.value["repository_credentials_provider_arn"]
                  }
              }
            }
        }
        dynamic "model_data_source" {
          for_each = container.value.model_data_source
            content {
              dynamic "s3_data_source" {
                for_each = model_data_source.value.s3_data_source
                  content {
                    s3_uri           = s3_data_source.value["s3_uri"]
                    s3_data_type     = s3_data_source.value["s3_data_type"]
                    compression_type = s3_data_source.value["compression_type"]
                  }
              }
            }
        }
      }
  } 
  dynamic "inference_execution_config" {
    for_each = var.sagemaker_model_inference_execution_config
      content {
        mode = inference_execution_config.value["mode"]
      }
  }
  dynamic "primary_container" {
    for_each = var.sagemaker_model_primary_container
      content {
        container_hostname = primary_container.value["container_hostname"]
        environment        = primary_container.value["environment"]
        image              = primary_container.value["image"]
        mode               = primary_container.value["mode"]
        model_data_url     = primary_container.value["model_data_url"]
        model_package_name = primary_container.value["model_package_name"]
        dynamic "image_config" {
          for_each = primary_container.value.image_config
            content {
              repository_access_mode = image_config.value["repository_access_mode"]
              dynamic "repository_auth_config" {
                for_each = image_config.value.repository_auth_config
                  content {
                    repository_credentials_provider_arn = repository_auth_config.value["repository_credentials_provider_arn"]
                  }
              }
            }
        }
        dynamic "model_data_source" {
          for_each = primary_container.value.model_data_source
            content {
              dynamic "s3_data_source" {
                for_each = model_data_source.value.s3_data_source
                  content {
                    s3_uri           = s3_data_source.value["s3_uri"]
                    s3_data_type     = s3_data_source.value["s3_data_type"]
                    compression_type = s3_data_source.value["compression_type"]
                  }
              }
            }
        }
      }
  }
  dynamic "vpc_config" {
    for_each = var.sagemaker_model_vpc_config
      content {
        subnets            = vpc_config.value["subnets"]
        security_group_ids = vpc_config.value["security_group_ids"] 
      }
  }
}
