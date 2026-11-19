resource "aws_emrcontainers_job_template" "emrcontainers_job_template" {
  kms_key_arn = var.emrcontainers_job_template_kms_key_arn
  name        = var.emrcontainers_job_template_name
  tags        = var.emrcontainers_job_template_tags
 
  dynamic "job_template_data" {
    for_each = var.emrcontainers_job_template_job_template_data
      content {
        execution_role_arn = job_template_data.value["execution_role_arn"]
        job_tags           = job_template_data.value["job_tags"]
        release_label      = job_template_data.value["release_label"]
        dynamic "configuration_overrides" {
          for_each = job_template_data.value.configuration_overrides
            content {
              dynamic "application_configuration" {
                for_each = configuration_overrides.value.application_configuration
                  content {
                    classification = application_configuration.value["classification"]
                    properties     = application_configuration.value["properties"]
                    dynamic "configurations" {
                      for_each = application_configuration.value.configurations
                        content {
                          classification = configurations.value["classification"]
                          properties     = configurations.value["properties"]
                        }
                    }
                  }
              }
              dynamic "monitoring_configuration" {
                for_each = configuration_overrides.value.monitoring_configuration
                  content {
                    persistent_app_ui = monitoring_configuration.value["persistent_app_ui"]
                    dynamic "cloud_watch_monitoring_configuration" {
                      for_each = monitoring_configuration.value.cloud_watch_monitoring_configuration
                        content {
                          log_group_name         = cloud_watch_monitoring_configuration.value["log_group_name"]
                          log_stream_name_prefix = cloud_watch_monitoring_configuration.value["log_stream_name_prefix"]
                        }
                    }
                    dynamic "s3_monitoring_configuration" {
                      for_each = monitoring_configuration.value.s3_monitoring_configuration
                        content {
                          log_uri = s3_monitoring_configuration.value["log_uri"]
                        }
                    }
                  }
              }
            }
        }
        dynamic "job_driver" {
          for_each = job_template_data.value.job_driver
            content {
              dynamic "spark_sql_job_driver" {
                for_each = job_driver.value.spark_sql_job_driver
                  content {
                    entry_point          = spark_sql_job_driver.value["entry_point"]
                    spark_sql_parameters = spark_sql_job_driver.value["spark_sql_parameters"]
                  }
              }
              dynamic "spark_submit_job_driver" {
                for_each = job_driver.value.spark_submit_job_driver
                  content {
                    entry_point             = spark_submit_job_driver.value["entry_point"]
                    entry_point_arguments   = spark_submit_job_driver.value["entry_point_arguments"]
                    spark_submit_parameters = spark_submit_job_driver.value["spark_submit_parameters"]
                  }
              }
            }
        }
      }
  } 
}
