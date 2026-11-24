resource "aws_lambdamicrovms_microvm" "lambdamicrovms_microvm" {
  image_arn                   = var.lambdamicrovms_microvm_image_arn
  egress_network_connectors   = var.lambdamicrovms_microvm_egress_network_connectors
  execution_role_arn          = var.lambdamicrovms_microvm_execution_role_arn 
  image_version               = var.lambdamicrovms_microvm_image_version
  ingress_network_connectors  = var.lambdamicrovms_microvm_ingress_network_connectors
  maximum_duration_in_seconds = var.lambdamicrovms_microvm_maximum_duration_in_seconds
  run_hook_payload            = var.lambdamicrovms_microvm_run_hook_payload

  dynamic "idle_policy" {
    for_each = var.lambdamicrovms_microvm_idle_policy
      content {
        auto_resume_enabled        = idle_policy.value["auto_resume_enabled"]
        max_idle_duration_seconds  = idle_policy.value["max_idle_duration_seconds"]
        suspended_duration_seconds = idle_policy.value["suspended_duration_seconds"]
      }
  }
  dynamic "logging" {
    for_each = var.lambdamicrovms_microvm_logging
      content {
        dynamic "cloudwatch" {
          for_each = logging.value.cloudwatch
            content {
              log_group  = cloudwatch.value["log_group"]
              log_stream = cloudwatch.value["log_stream"]
            }
        }
        dynamic "disabled" {
          for_each = logging.value.disabled
            content {
            }
        }
      }
  }
}
