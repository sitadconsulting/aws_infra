resource "aws_lambda_function" "lambda_function" {
  architectures                        = var.lambda_function_architectures
  code_sha256                          = var.lambda_function_code_sha256
  code_signing_config_arn              = var.lambda_function_code_signing_config_arn
  description                          = var.lambda_function_description
  filename                             = var.lambda_function_filename
  function_name                        = var.lambda_function_function_name
  handler                              = var.lambda_function_handler
  image_uri                            = var.lambda_function_image_uri
  kms_key_arn                          = var.lambda_function_kms_key_arn
  layers                               = var.lambda_function_layers
  memory_size                          = var.lambda_function_memory_size
  package_type                         = var.lambda_function_package_type
  publish                              = var.lambda_function_publish
  publish_to                           = var.lambda_function_publish_to
  replace_security_groups_on_destroy   = var.lambda_function_replace_security_groups_on_destroy
  replacement_security_group_ids       = var.lambda_function_replacement_security_group_ids
  reserved_concurrent_executions       = var.lambda_function_reserved_concurrent_executions
  role                                 = var.lambda_function_role
  runtime                              = var.lambda_function_runtime
  s3_bucket                            = var.lambda_function_s3_bucket
  s3_key                               = var.lambda_function_s3_key
  s3_object_version                    = var.lambda_function_s3_object_version      
  skip_destroy                         = var.lambda_function_skip_destroy
  source_kms_key_arn                   = var.lambda_function_source_kms_key_arn
  source_code_hash                     = var.lambda_function_source_code_hash
  tags                                 = var.lambda_function_tags
  timeout                              = var.lambda_function_timeout
  use_resource_timeout_for_propagation = var.lambda_function_use_resource_timeout_for_propagation
  

  dynamic "capacity_provider_config" {
    for_each = var.lambda_function_capacity_provider_config
      content {
        dynamic "lambda_managed_instances_capacity_provider_config" {
          for_each = capacity_provider_config.value.lambda_managed_instances_capacity_provider_config
            content {
              capacity_provider_arn                     = lambda_managed_instances_capacity_provider_config.value["capacity_provider_arn"]
              execution_environment_memory_gib_per_vcpu = lambda_managed_instances_capacity_provider_config.value["execution_environment_memory_gib_per_vcpu"]
              per_execution_environment_max_concurrency = lambda_managed_instances_capacity_provider_config.value["per_execution_environment_max_concurrency"]
            }
        }
      }
  }
  dynamic "dead_letter_config" {
    for_each = var.lambda_function_dead_letter_config
      content {
        target_arn = dead_letter_config.value["target_arn"]
      }
  }
  dynamic "durable_config" {
    for_each = var.lambda_function_durable_config
      content {
        execution_timeout = durable_config.value["execution_timeout"]
        kms_key_arn       = durable_config.value["kms_key_arn"]
        retention_period  = durable_config.value["retention_period"]
      }
  }
  dynamic "environment" {
    for_each = var.lambda_function_environment
      content {
        variables = environment.value["variables"]
      }
  }
  dynamic "ephemeral_storage" {
    for_each = var.lambda_function_ephemeral_storage
      content {
        size = ephemeral_storage.value["size"]
      }
  }
  dynamic "file_system_config" {
    for_each = var.lambda_function_file_system_config
      content {
        arn              = file_system_config.value["arn"] 
        local_mount_path = file_system_config.value["local_mount_path"]
      } 
  }
  dynamic "image_config" {
    for_each = var.lambda_function_image_config
      content {
        command           = image_config.value["command"]
        entry_point       = image_config.value["entry_point"]
        working_directory = image_config.value["working_directory"]
      }
  }
  dynamic "logging_config" {
    for_each = var.lambda_function_logging_config
      content {
        application_log_level = logging_config.value["application_log_level"]
        log_format            = logging_config.value["log_format"]
        log_group             = logging_config.value["log_group"]
        system_log_level      = logging_config.value["system_log_level"]
      }
  }
  dynamic "snap_start" {
    for_each = var.lambda_function_snap_start
      content {
        apply_on = snap_start.value["apply_on"] 
      }
  }
  dynamic "tenancy_config" {
    for_each = var.lambda_function_tenancy_config
      content {
        tenant_isolation_mode = tenancy_config.value["tenant_isolation_mode"]
      }
  }
  dynamic "tracing_config" {
    for_each = var.lambda_function_tracing_config
      content {
        mode = tracing_config.value["mode"]
      }
  }
  dynamic "vpc_config" {
    for_each = var.lambda_function_vpc_config
      content {
        ipv6_allowed_for_dual_stack = vpc_config.value["ipv6_allowed_for_dual_stack"]
        security_group_ids          = vpc_config.value["security_group_ids"]
        subnet_ids                  = vpc_config.value["subnet_ids"]
      }
  }
}
