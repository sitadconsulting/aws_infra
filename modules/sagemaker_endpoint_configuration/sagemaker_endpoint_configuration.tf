resource "aws_sagemaker_endpoint_configuration" "sagemaker_endpoint_configuration" {
  kms_key_arn = var.sagemaker_endpoint_configuration_kms_key_arn
  name        = var.sagemaker_endpoint_configuration_name
  name_prefix = var.sagemaker_endpoint_configuration_name_prefix
  tags        = var.sagemaker_endpoint_configuration_tags
  
  dynamic "async_inference_config" {
    for_each = var.sagemaker_endpoint_configuration_async_inference_config
      content {
        dynamic "client_config" {
          for_each = async_inference_config.value.client_config
            content {
              max_concurrent_invocations_per_instance = client_config.value["max_concurrent_invocations_per_instance"]
            }
        }
        dynamic "output_config" {
          for_each = async_inference_config.value.output_config
            content {
              kms_key_id      = output_config.value["kms_key_id"]
              s3_failure_path = output_config.value["s3_failure_path"]
              s3_output_path  = output_config.value["s3_output_path"] 
              dynamic "notification_config" {
                for_each = async_inference_config.value.notification_config
                  content {
                    error_topic                   = notification_config.value["error_topic"]
                    include_inference_response_in = notification_config.value["include_inference_response_in"]
                    success_topic                 = notification_config.value["success_topic"]
                  }
              }
            }
        }
      }
  }
  dynamic "data_capture_config" {
    for_each = var.sagemaker_endpoint_configuration_data_capture_config
      content {
        destination_s3_uri          = data_capture_config.value["destination_s3_uri"]
        enable_capture              = data_capture_config.value["enable_capture"]
        initial_sampling_percentage = data_capture_config.value["initial_sampling_percentage"]
        kms_key_id                  = data_capture_config.value["kms_key_id"]
        dynamic "capture_content_type_header" {
          for_each = data_capture_config.value.capture_content_type_header
            content {
              csv_content_types  = capture_content_type_header.value["csv_content_types"]
              json_content_types = capture_content_type_header.value["json_content_types"]
            }
        }
        dynamic "capture_options" {
          for_each = data_capture_config.value.capture_options
            content {
              capture_mode = capture_options.value["capture_mode"]
            }
        }
      }
  }
  dynamic "production_variants" {
    for_each = var.sagemaker_endpoint_configuration_production_variants
      content {
        accelerator_type                                  = production_variants.value["accelerator_type"]
        container_startup_health_check_timeout_in_seconds = production_variants.value["container_startup_health_check_timeout_in_seconds"]
        enable_ssm_access                                 = production_variants.value["enable_ssm_access"]
        initial_instance_count                            = production_variants.value["initial_instance_count"]
        initial_variant_weight                            = production_variants.value["initial_variant_weight"]
        instance_type                                     = production_variants.value["instance_type"]
        model_data_download_timeout_in_seconds            = production_variants.value["model_data_download_timeout_in_seconds"]
        model_name                                        = production_variants.value["model_name"]
        variant_name                                      = production_variants.value["variant_name"]
        volume_size_in_gb                                 = production_variants.value["volume_size_in_gb"]
        dynamic "core_dump_config" {
          for_each = production_variants.value.core_dump_config
            content {
              destination_s3_uri = core_dump_config.value["destination_s3_uri"]
              kms_key_id         = core_dump_config.value["kms_key_id"]
            }
        }
        dynamic "serverless_config" {
          for_each = production_variants.value.serverless_config
            content {
              max_concurrency         = serverless_config.value["max_concurrency"]
              memory_size_in_mb       = serverless_config.value["memory_size_in_mb"]
              provisioned_concurrency = serverless_config.value["provisioned_concurrency"]
            }
        }
      }
  }
  dynamic "shadow_production_variants" {
    for_each = var.sagemaker_endpoint_configuration_shadow_production_variants
      content {
        accelerator_type                                  = shadow_production_variants.value["accelerator_type"]
        container_startup_health_check_timeout_in_seconds = shadow_production_variants.value["container_startup_health_check_timeout_in_seconds"] 
        enable_ssm_access                                 = shadow_production_variants.value["enable_ssm_access"]
        initial_instance_count                            = shadow_production_variants.value["initial_instance_count"]
        initial_variant_weight                            = shadow_production_variants.value["initial_variant_weight"]
        instance_type                                     = shadow_production_variants.value["instance_type"]
        model_data_download_timeout_in_seconds            = shadow_production_variants.value["model_data_download_timeout_in_seconds"]
        model_name                                        = shadow_production_variants.value["model_name"]
        variant_name                                      = shadow_production_variants.value["variant_name"]
        volume_size_in_gb                                 = shadow_production_variants.value["volume_size_in_gb"]
        dynamic "core_dump_config" {
          for_each = shadow_production_variants.value.core_dump_config
            content {
              destination_s3_uri = core_dump_config.value["destination_s3_uri"]
              kms_key_id         = core_dump_config.value["kms_key_id"]
            }
        }
        dynamic "serverless_config" {
          for_each = shadow_production_variants.value.serverless_config
            content {
              max_concurrency         = serverless_config.value["max_concurrency"]
              memory_size_in_mb       = serverless_config.value["memory_size_in_mb"]
              provisioned_concurrency = serverless_config.value["provisioned_concurrency"]
            }
        }
      }
  }
}
