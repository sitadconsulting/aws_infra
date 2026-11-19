resource "aws_emrserverless_application" "emrserverless_application" {
  architecture     = var.emrserverless_application_architecture
  name             = var.emrserverless_application_name
  release_label    = var.emrserverless_application_release_label
  type             = var.emrserverless_application_type
  tags             = var.emrserverless_application_tags

  dynamic "auto_start_configuration" {
    for_each = var.emrserverless_application_auto_start_configuration
      content {
        enabled = auto_start_configuration.value["enabled"]
      }
  }  
  dynamic "auto_stop_configuration" {
    for_each = var.emrserverless_application_auto_stop_configuration
      content {
        enabled              = auto_stop_configuration.value["enabled"]
        idle_timeout_minutes = auto_stop_configuration.value["idle_timeout_minutes"]
      }
  }
  dynamic "image_configuration" {
    for_each = var.emrserverless_application_image_configuration
      content {
        image_uri = image_configuration.value["image_uri"]
      }
  }
  dynamic "initial_capacity" {
    for_each = var.emrserverless_application_initial_capacity
      content {
        initial_capacity_type = initial_capacity.value["initial_capacity_type"]
        dynamic "initial_capacity_config" {
          for_each = initial_capacity.value.initial_capacity_config
            content {
              worker_count = initial_capacity_config.value["worker_count"]
              dynamic "worker_configuration" {
                for_each = initial_capacity_config.value.worker_configuration
                  content {
                    cpu    = worker_configuration.value["cpu"]
                    disk   = worker_configuration.value["disk"]
                    memory = worker_configuration.value["memory"]
                  }
              }
            }
        }
      }
  }
  dynamic "interactive_configuration" {
    for_each = var.emrserverless_application_interactive_configuration
      content {
        livy_endpoint_enabled = interactive_configuration.value["livy_endpoint_enabled"]
        studio_enabled        = interactive_configuration.value["studio_enabled"]
      }
  }
  dynamic "maximum_capacity" {
    for_each = var.emrserverless_application_maximum_capacity
      content {
        cpu    = maximum_capacity.value["cpu"]
        disk   = maximum_capacity.value["disk"]
        memory = maximum_capacity.value["memory"]
      }
  }
  dynamic "monitoring_configuration" {
    for_each = var.emrserverless_application_monitoring_configuration
      content {
        dynamic "cloudwatch_logging_configuration" {
          for_each = monitoring_configuration.value.cloudwatch_logging_configuration
            content {
              enabled                = cloudwatch_logging_configuration.value["enabled"]
              log_group_name         = cloudwatch_logging_configuration.value["log_group_name"]
              log_stream_name_prefix = cloudwatch_logging_configuration.value["log_stream_name_prefix"]
              encryption_key_arn     = cloudwatch_logging_configuration.value["encryption_key_arn"]
              dynamic "log_types" {
                for_each = cloudwatch_logging_configuration.value.log_types
                  content {
                    name   = log_types.value["name"]
                    values = log_types.value["values"]
                  }
              }
            }
        }
        dynamic "managed_persistence_monitoring_configuration" {
          for_each = monitoring_configuration.value.managed_persistence_monitoring_configuration
            content {
              enabled            = managed_persistence_monitoring_configuration.value["enabled"]
              encryption_key_arn = managed_persistence_monitoring_configuration.value["encryption_key_arn"]
            }
        }
        dynamic "prometheus_monitoring_configuration" {
          for_each = monitoring_configuration.value.prometheus_monitoring_configuration
            content {
              remote_write_url = prometheus_monitoring_configuration.value["remote_write_url"]
            }
        }
        dynamic "s3_monitoring_configuration" {
          for_each = monitoring_configuration.value.s3_monitoring_configuration
            content {
              log_uri            = s3_monitoring_configuration.value["log_uri"]
              encryption_key_arn = s3_monitoring_configuration.value["encryption_key_arn"]
            }
        }
      }
  }
  dynamic "network_configuration" {
    for_each = var.emrserverless_application_network_configuration
      content {
        security_group_ids = network_configuration.value["security_group_ids"] 
        subnet_ids         = network_configuration.value["subnet_ids"]
      }
  }
  dynamic "runtime_configuration" {
    for_each = var.emrserverless_application_runtime_configuration
      content {
        classification = runtime_configuration.value["classification"]
        properties     = runtime_configuration.value["properties"]
      }
  }
  dynamic "scheduler_configuration" {
    for_each = var.emrserverless_application_scheduler_configuration
      content {
        max_concurrent_runs   = scheduler_configuration.value["max_concurrent_runs"]
        queue_timeout_minutes = scheduler_configuration.value["queue_timeout_minutes"]
      }
  }
}
