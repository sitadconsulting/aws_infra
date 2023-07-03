resource "aws_msk_cluster" "msk_cluster" {
  cluster_name           = var.msk_cluster_cluster_name
  enhanced_monitoring    = var.msk_cluster_enhanced_monitoring
  kafka_version          = var.msk_cluster_kafka_version
  number_of_broker_nodes = var.msk_cluster_number_of_broker_nodes
  storage_mode           = var.msk_cluster_storage_mode
  tags                   = var.msk_cluster_tags

  dynamic "broker_node_group_info" {
    for_each = var.msk_cluster_broker_node_group_info
      content {
        az_distribution = broker_node_group_info.value["az_distribution"]
        client_subnets  = broker_node_group_info.value["client_subnets"]
        instance_type   = broker_node_group_info.value["instance_type"]
        security_groups = broker_node_group_info.value["security_groups"]
        dynamic "connectivity_info" {
          for_each = broker_node_group_info.value.connectivity_info
            content {
              dynamic "public_access" {
                for_each = connectivity_info.value.public_access
                  content {
                    type = public_access.value["type"]
                  }
              }
            }
        }
        dynamic "storage_info" {
          for_each = broker_node_group_info.value.storage_info
            content {
              dynamic "ebs_storage_info" {
                for_each = storage_info.value.ebs_storage_info
                  content {
                    volume_size = ebs_storage_info.value["volume_size"]
                    dynamic "provisioned_throughput" {
                      for_each = ebs_storage_info.value.provisioned_throughput
                        content {
                          enabled           = provisioned_throughput.value["enabled"]
                          volume_throughput = provisioned_throughput.value["volume_throughput"]
                        }
                    }
                  }
              }
            }
        }
      }
  }
  dynamic "client_authentication" {
    for_each = var.msk_cluster_client_authentication
      content {
        unauthenticated = client_authentication.value["unauthenticated"]
        dynamic "sasl" {
          for_each = client_authentication.value.sasl
            content {
              iam   = sasl.value["iam"]
              scram = sasl.value["scram"]
            }
        }
        dynamic "tls" {
          for_each = client_authentication.value.tls
            content {
              certificate_authority_arns = tls.value["certificate_authority_arns"]
            }
        }
      }
  }
  dynamic "configuration_info" {
    for_each = var.msk_cluster_configuration_info
      content {
        arn      = configuration_info.value["arn"]
        revision = configuration_info.value["revision"]
      }
  }
  dynamic "encryption_info" {
    for_each = var.msk_cluster_encryption_info 
      content {
        encryption_at_rest_kms_key_arn = encryption.value["encryption_at_rest_kms_key_arn"]
        dynamic "encryption_in_transit" {
          for_each = encryption_info.value.encryption_in_transit
            content {
              client_broker = encryption_in_transit.value["client_broker"]
              in_cluster    = encryption_in_transit.value["in_cluster"]
            }
        }
      }
  }
  dynamic "logging_info" {
    for_each = var.msk_cluster_logging_info
      content {
        dynamic "broker_logs" {
          for_each = logging_info.value.broker_logs
            content {
              dynamic "cloudwatch_logs" {
                for_each = broker_logs.value.cloudwatch_logs
                  content {
                    enabled   = cloudwatch_logs.value["enabled"]
                    log_group = cloudwatch_logs.value["log_group"]
                  }
              }
              dynamic "firehose" {
                for_each = broker_logs.value.firehose
                  content {
                    delivery_stream = firehose.value["delivery_stream"]
                    enabled         = firehose.value["enabled"]
                  }
              }
              dynamic "s3" {
                for_each = broker_logs.value.s3
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
  dynamic "open_monitoring" {
    for_each = var.msk_cluster_open_monitoring
      content {
        dynamic "prometheus" {
          content {
            dynamic "jmx_exporter" {
              content {
                enabled_in_broker = jmx_exporter.value["enabled_in_broker"]
              }
            }
            dynamic "node_exporter" {
              content {
                enabled_in_broker = node_exporter.value["enabled_in_broker"]
              }
            }
          }
        }
      }
  }
}
