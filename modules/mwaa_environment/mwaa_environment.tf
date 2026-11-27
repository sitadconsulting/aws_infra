resource "aws_mwaa_environment" "mwaa_environment" {
  airflow_configuration_options    = var.mwaa_environment_airflow_configuration_options
  airflow_version                  = var.mwaa_environment_airflow_version
  dag_s3_path                      = var.mwaa_environment_dag_s3_path
  endpoint_management              = var.mwaa_environment_endpoint_management
  environment_class                = var.mwaa_environment_environment_class
  execution_role_arn               = var.mwaa_environment_execution_role_arn
  kms_key                          = var.mwaa_environment_kms_key
  max_webservers                   = var.mwaa_environment_max_webservers
  max_workers                      = var.mwaa_environment_max_workers
  min_webservers                   = var.mwaa_environment_min_webservers
  min_workers                      = var.mwaa_environment_min_workers
  name                             = var.mwaa_environment_name
  plugins_s3_object_version        = var.mwaa_environment_plugins_s3_object_version
  plugins_s3_path                  = var.mwaa_environment_plugins_s3_path
  requirements_s3_object_version   = var.mwaa_environment_requirements_s3_object_version
  requirements_s3_path             = var.mwaa_environment_requirements_s3_path
  schedulers                       = var.mwaa_environment_schedulers
  source_bucket_arn                = var.mwaa_environment_source_bucket_arn
  startup_script_s3_object_version = var.mwaa_environment_startup_script_s3_object_version
  startup_script_s3_path           = var.mwaa_environment_startup_script_s3_path 
  tags                             = var.mwaa_environment_tags
  webserver_access_mode            = var.mwaa_environment_webserver_access_mode
  weekly_maintenance_window_start  = var.mwaa_environment_weekly_maintenance_window_start
  worker_replacement_strategy      = var.mwaa_environment_worker_replacement_strategy
  

  dynamic "logging_configuration" {
    for_each = var.mwaa_environment_logging_configuration
      content {
        dynamic "dag_processing_logs" {
          for_each = logging_configuration.value.dag_processing_logs
            content {
              enabled                   = dag_processing_logs.value["enabled"]
              log_level                 = dag_processing_logs.value["log_level"]
            }
        }
        dynamic "scheduler_logs" {
          for_each = logging_configuration.value.scheduler_logs
            content {
              enabled                   = scheduler_logs.value["enabled"]
              log_level                 = scheduler_logs.value["log_level"]
            }
        }
        dynamic "task_logs" {
          for_each = logging_configuration.value.task_logs
            content {
              enabled                   = task_logs.value["enabled"]
              log_level                 = task_logs.value["log_level"]
            }
        }
        dynamic "webserver_logs" {
          for_each = logging_configuration.value.webserver_logs
            content {
              enabled                   = webserver_logs.value["enabled"]
              log_level                 = webserver_logs.value["log_level"]
            }
        }
        dynamic "worker_logs" {
          for_each = logging_configuration.value.worker_logs
            content {
              enabled                   = worker_logs.value["enabled"]
              log_level                 = worker_logs.value["log_level"]
            }
        }
      }
  }
  dynamic "network_configuration" {
    for_each = var.mwaa_environment_network_configuration
      content {
        security_group_ids = network_configuration.value["security_group_ids"]
        subnet_ids         = network_configuration.value["subnet_ids"]
      }
  }
}
