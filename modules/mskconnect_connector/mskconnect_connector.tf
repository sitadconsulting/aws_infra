resource "aws_mskconnect_connector" "mskconnect_connector" {
  connector_configuration    = var.mskconnect_connector_connector_configuration
  description                = var.mskconnect_connector_description
  kafkaconnect_version       = var.mskconnect_connector_kafkaconnect_version
  name                       = var.mskconnect_connector_name
  service_execution_role_arn = var.mskconnect_connector_service_execution_role_arn
  

  dynamic "capacity" {
    for_each = var.mskconnect_connector_capacity
      content {
        dynamic "autoscaling" {
          for_each = capacity.value.autoscaling
            content {
              max_worker_count = autoscaling.value["max_worker_count"]
              mcu_count        = autoscaling.value["mcu_count"]
              min_worker_count = autoscaling.value["min_worker_count"]
              dynamic "scale_in_policy" {
                for_each = autoscaling.value.scale_in_policy
                  content {
                    cpu_utilization_percentage = scale_in_policy.value["cpu_utilization_percentage"]
                  }
              }
              dynamic "scale_out_policy" {
                for_each = autoscaling.value.scale_out_policy
                  content {
                    cpu_utilization_percentage = scale_out_policy.value["cpu_utilization_percentage"] 
                  }
              }
            }
        }
        dynamic "provisioned_capacity" {
          for_each = capacity.value.provisioned_capacity
            content {
              mcu_count    = provisioned_capacity.value["mcu_count"]
              worker_count =  provisioned_capacity.value["worker_count"]
            }
        }
      }
  }
  dynamic "kafka_cluster" {
    for_each = var.mskconnect_connector_kafka_cluster
      content {
        dynamic "apache_kafka_cluster" {
          for_each = kafka_cluster.value.apache_kafka_cluster
            content {
              bootstrap_servers = apache_kafka_cluster.value["bootstrap_servers"]
              dynamic "vpc" {
                for_each = apache_kafka_cluster.value.vpc
                  content {
                    security_groups = vpc.value["security_groups"]
                    subnets         = vpc.value["subnets"]
                  }
              }
            }
        }
      }
  }
  dynamic "kafka_cluster_client_authentication" {
    for_each = var.mskconnect_connector_kafka_cluster_client_authentication
      content {
        authentication_type = kafka_cluster_client_authentication.value["authentication_type"]
      }
  }
  dynamic "kafka_cluster_encryption_in_transit" {
    for_each = var.mskconnect_connector_kafka_cluster_encryption_in_transit
      content {
        encryption_type = kafka_cluster_encryption_in_transit.value["encryption_type"]
      }
  }
  dynamic "log_delivery" {
    for_each = var.mskconnect_connector_log_delivery
      content {
        dynamic "worker_log_delivery" {
          for_each = log_delivery.value.worker_log_delivery
            content {
              dynamic "cloudwatch_logs" {
                for_each = worker_log_delivery.value.cloudwatch_logs
                  content {
                    enabled   = cloudwatch_logs.value["enabled"]
                    log_group = cloudwatch_logs.value["log_group"]
                  }
              }
              dynamic "firehose" {
                for_each =  worker_log_delivery.value.firehose
                  content {
                    delivery_stream = firehose.value["delivery_stream"]
                    enabled         = firehose.value["enabled"]
                  }
              }
              dynamic "s3" {
                for_each = worker_log_delivery.value.s3
                  content {
                    bucket  = s3.value["bucket"]
                    enabled = s3.value["enabled"]
                    prefix  = s3.value["prefix"]
                  }
              }
            }
        }
      }
  } 
  dynamic "plugin" {
    for_each = var.mskconnect_connector_plugin
      content {
        dynamic "custom_plugin" {
          for_each = plugin.value.custom_plugin
            content {
              arn      = custom_plugin.value["arn"]
              revision = custom_plugin.value["revision"]
            }
        }
      }
  }
  dynamic "worker_configuration" {
    for_each = var.mskconnect_connector_worker_configuration
      content {
        arn      = worker_configuration.value["arn"]
        revision = worker_configuration.value["revision"]
      }
  }
}
