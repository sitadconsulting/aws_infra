resource "aws_lambda_function" "lambda_function" {
  architectures                  = var.lambda_function_architectures
  code_signing_config_arn        = var.lambda_function_code_signing_config_arn
  description                    = var.lambda_function_description
  filename                       = var.lambda_function_filename
  function_name                  = var.lambda_function_function_name
  handler                        = var.lambda_function_handler
  image_uri                      = var.lambda_function_image_uri
  kms_key_arn                    = var.lambda_function_kms_key_arn
  layers                         = var.lambda_function_layers
  memory_size                    = var.lambda_function_memory_size
  package_type                   = var.lambda_function_package_type
  publish                        = var.lambda_function_publish
  reserved_concurrent_executions = var.lambda_function_reserved_concurrent_executions
  role                           = var.lambda_function_role
  runtime                        = var.lambda_function_runtime
  s3_bucket                      = var.lambda_function_s3_bucket
  s3_key                         = var.lambda_function_s3_key
  s3_object_version              = var.lambda_function_s3_object_version      
  skip_destroy                   = var.lambda_function_skip_destroy
  source_code_hash               = var.lambda_function_source_code_hash
  tags                           = var.lambda_function_tags
  timeout                        = var.lambda_function_timeout
  
  dynamic "dead_letter_config" {
    for_each = var.lambda_function_dead_letter_config
      content {
        target_arn = dead_letter_config.value["target_arn"]
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
  dynamic "snap_start" {
    for_each = var.lambda_function_snap_start
      content {
        apply_on = snap_start.value["apply_on"] 
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
        security_group_ids = vpc_config.value["security_group_ids"]
        subnet_ids         = vpc_config.value["subnet_ids"]
      }
  }
}
