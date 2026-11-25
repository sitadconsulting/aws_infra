resource "aws_lambdaweb_function_revision" "lambdaweb_function_revision" {
  description   = var.lambdaweb_function_revision_description
  function_name = var.lambdaweb_function_revision_function_name
  kms_key_arn   = var.lambdaweb_function_revision_kms_key_arn
  
  dynamic "build_config" {
    for_each = var.lambdaweb_function_revision_build_config
      content {
        dynamic "code_config" {
          for_each = build_config.value.code_config
            content {
              dynamic "s3_object" {
                for_each = code_config.value.s3_object
                  content {
                    bucket     = s3_object.value["bucket"]
                    key        = s3_object.value["key"]
                    version_id = s3_object.value["version_id"]
                  }
              }
            }
        }
        dynamic "runtime_config" {
          for_each = build_config.value.runtime_config
            content {
              runtime = runtime_config.value["runtime"]
            }
        }
      }
  }
  dynamic "service_config" {
    for_each = var.lambdaweb_function_revision_service_config
      content {
        egress_network_connector_arn    = service_config.value["egress_network_connector_arn"]
        environment_variables           = service_config.value["environment_variables"]
        execution_role_arn              = service_config.value["execution_role_arn"]
        max_concurrency_per_environment = service_config.value["max_concurrency_per_environment"]
        timeout_seconds                 = service_config.value["timeout_seconds"]
        dynamic "telemetry_config" {
          for_each = service_config.value.telemetry_config
            content {
              dynamic "logging_config" {
                for_each = telemetry_config.value.logging_config
                  content {
                    application_log_level = logging_config.value["application_log_level"]
                    log_group             = logging_config.value["log_group"]
                    system_log_level      = logging_config.value["system_log_level"]
                  }
              }
            }
        }
      }
  }
}
