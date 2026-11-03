resource "aws_synthetics_canary" "synthetics_canary" {
  artifact_s3_location     = var.synthetics_canary_artifact_s3_location
  delete_lambda            = var.synthetics_canary_delete_lambda
  execution_role_arn       = var.synthetics_canary_execution_role_arn
  failure_retention_period = var.synthetics_canary_failure_retention_period
  handler                  = var.synthetics_canary_handler
  kms_key_arn              = var.synthetics_canary_kms_key_arn
  name                     = var.synthetics_canary_name
  runtime_version          = var.synthetics_canary_runtime_version
  s3_bucket                = var.synthetics_canary_s3_bucket
  s3_key                   = var.synthetics_canary_s3_key
  s3_version               = var.synthetics_canary_s3_version
  start_canary             = var.synthetics_canary_start_canary
  success_retention_period = var.synthetics_canary_success_retention_period
  tags                     = var.synthetics_canary_tags
  zip_file                 = var.synthetics_canary_zip_file
  

  dynamic "artifact_config" {
    for_each = var.synthetics_canary_artifact_config
      content {
        dynamic "s3_encryption" {
          for_each = artifact_config.value.s3_encryption
            content {
              encryption_mode = s3_encryption.value["encryption_mode"]
              kms_key_arn     = s3_encryption.value["kms_key_arn"]
            }
        }
      }
  }
  dynamic "run_config" {
    for_each = var.synthetics_canary_run_config
      content {
        timeout_in_seconds     = run_config.value["timeout_in_seconds"] 
        memory_in_mb           = run_config.value["memory_in_mb"]
        active_tracing         = run_config.value["active_tracing"]
        environment_variables  = run_config.value["environment_variables"]
        ephemeral_storage      = run_config.value["ephemeral_storage"]
      }
  }
  dynamic "schedule" {
    for_each = var.synthetics_canary_schedule
      content {
        expression          = schedule.value["expression"]
        duration_in_seconds = schedule.value["duration_in_seconds"] 
        dynamic "retry_config" {
          for_each = schedule.value.retry_config
            content {
              max_retries = retry_config.value["max_retries"]
            }
        }
      }
  }
  dynamic "vpc_config" {
    for_each = var.synthetics_canary_vpc_config
      content {
        subnet_ids                  = vpc_config.value["subnet_ids"]
        security_group_ids          = vpc_config.value["security_group_ids"]
        ipv6_allowed_for_dual_stack = vpc_config.value["ipv6_allowed_for_dual_stack"]
      }
  }
}
