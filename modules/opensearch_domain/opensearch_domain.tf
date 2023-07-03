resource "aws_opensearch_domain" "opensearch_domain" {
  access_policies  = var.opensearch_domain_access_policies
  advanced_options = var.opensearch_domain_advanced_options
  domain_name      = var.opensearch_domain_domain_name
  engine_version   = var.opensearch_domain_engine_version
  tags             = var.opensearch_domain_tags
  
  dynamic "advanced_security_options" {
    for_each = var.opensearch_domain_advanced_security_options
      content {
        anonymous_auth_enabled         = advanced_security_options.value["anonymous_auth_enabled"]
        enabled                        = advanced_security_options.value["enabled"]
        internal_user_database_enabled = advanced_security_options.value["internal_user_database_enabled"]  
        dynamic "master_user_options" {
          for_each = advanced_security_options.value.master_user_options
            content {
               master_user_arn      = master_user_options.value["master_user_arn"]
               master_user_name     = master_user_options.value["master_user_name"]
               master_user_password = master_user_options.value["master_user_password"]
            }
        }
      }
  }
  dynamic "auto_tune_options" {
    for_each = var.opensearch_domain_auto_tune_options
      content {
        desired_state        = auto_tune_options.value["desired_state"]
        rollback_on_disable  = auto_tune_options.value["rollback_on_disable"]
        dynamic "maintenance_schedule" {
          for_each = auto_tune_options.value.maintenance_schedule
            content {
              cron_expression_for_recurrence = maintenance_schedule.value["cron_expression_for_recurrence"]
              start_at                       =  maintenance_schedule.value["start_at"]
              dynamic "duration" {
                for_each = maintenance_schedule.value.duration
                  content {
                    unit  = duration.value["unit"]
                    value = duration.value["value"]
                  }
              } 
            }
        }
      }
  }
  dynamic "cluster_config" {
    for_each = var.opensearch_domain_cluster_config
      content {
        dedicated_master_count   = cluster_config.value["dedicated_master_count"]
        dedicated_master_enabled = cluster_config.value["dedicated_master_enabled"]
        dedicated_master_type    = cluster_config.value["dedicated_master_type"]
        instance_count           = cluster_config.value["instance_count"]
        instance_type            = cluster_config.value["instance_type"]
        warm_count               = cluster_config.value["warm_count"]
        warm_enabled             = cluster_config.value["warm_enabled"]
        warm_type                = cluster_config.value["warm_type"]
        zone_awareness_enabled   = cluster_config.value["zone_awareness_enabled"]
        dynamic "cold_storage_options" {
          for_each = cluster_config.value.cold_storage_options 
            content {
              enabled = cold_storage_options.value["enabled"]
            }
        }
      }
  }
  dynamic "cognito_options" {
    for_each = var.opensearch_domain_cognito_options
      content {
        enabled          = cognito_options.value["enabled"]
        identity_pool_id = cognito_options.value["identity_pool_id"]
        role_arn         = cognito_options.value["role_arn"]
        user_pool_id     = cognito_options.value["user_pool_id"]
      }
  }
  dynamic "domain_endpoint_options" {
    for_each = var.opensearch_domain_domain_endpoint_options
      content {
        custom_endpoint                 = domain_endpoint_options.value["custom_endpoint"]
        custom_endpoint_certificate_arn = domain_endpoint_options.value["custom_endpoint_certificate_arn"]
        custom_endpoint_enabled         = domain_endpoint_options.value["custom_endpoint_enabled"]
        enforce_https                   = domain_endpoint_options.value["enforce_https"]
        tls_security_policy             = domain_endpoint_options.value["tls_security_policy"]
      }
  }
  dynamic "ebs_options" {
    for_each = var.opensearch_domain_ebs_options
      content {
        ebs_enabled = ebs_options.value["ebs_enabled"]
        iops        = ebs_options.value["iops"]
        throughput  = ebs_options.value["throughput"]
        volume_size = ebs_options.value["volume_size"]
        volume_type = ebs_options.value["volume_type"]
      }
  }
  dynamic "encrypt_at_rest" {
    for_each = var.opensearch_domain_encrypt_at_rest
      content {
        enabled    = encrypt_at_rest.value["enabled"]
        kms_key_id =  encrypt_at_rest.value["kms_key_id"]
      }
  }
  dynamic "log_publishing_options" {
    for_each = var.opensearch_domain_log_publishing_options
      content {
        cloudwatch_log_group_arn = log_publishing_options.value["cloudwatch_log_group_arn"]
        enabled                  = log_publishing_options.value["enabled"]
        log_type                 = log_publishing_options.value["log_type"]
      }
  }
  dynamic "node_to_node_encryption" {
    for_each = var.opensearch_domain_node_to_node_encryption
      content {
        enabled = node_to_node_encryption.value["enabled"]
      }
  }
  dynamic "off_peak_window_options" {
    for_each = var.opensearch_domain_off_peak_window_options
      content {
        enabled         = off_peak_window_options.value["enabled"]
        dynamic "off_peak_window" {
          for_each = off_peak_window_options.value.off_peak_window
            content {
              dynamic "window_start_time" {
                for_each = off_peak_window.value.window_start_time
                  content {
                    hours   = window_start_time.value["hours"]
                    minutes = window_start_time.value["minutes"]
                  }
              }
            }
        }
      }
  }
  dynamic "snapshot_options" {
    for_each = var.opensearch_domain_snapshot_options
      content {
        automated_snapshot_start_hour = snapshot_options.value["automated_snapshot_start_hour"]
      }
  }
  dynamic "vpc_options" {
    for_each = var.opensearch_domain_vpc_options
      content {
        security_group_ids = vpc_options.value["security_group_ids"]
        subnet_ids         = vpc_options.value["subnet_ids"]
      }
  }
}
