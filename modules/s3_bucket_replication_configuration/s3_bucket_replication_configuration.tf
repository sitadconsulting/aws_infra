resource "aws_s3_bucket_replication_configuration" "s3_bucket_replication_configuration" {
  bucket = var.s3_bucket_replication_configuration_bucket
  role   = var.s3_bucket_replication_configuration_role
  token  = var.s3_bucket_replication_configuration_token

  dynamic "rule" {
    for_each = var.s3_bucket_replication_configuration_rule
      content {
        id       = rule.value["id"]
        priority = rule.value["priority"]
        status   = rule.value["status"]
        dynamic "delete_marker_replication" {
          for_each = rule.value.delete_marker_replication
            content {
              status = delete_marker_replication.value["status"]
            }
        }
        dynamic "destination" {
          for_each = ruke.value.destination
            content {
              account       = destination.value["account"]
              bucket        = destination.value["bucket"]
              storage_class = destination.value["stoage_class"]
              dynamic "access_control_translation" {
                for_each = destination.value.access_control_translation
                  content {
                    owner = access_control_translation.value["owner"]
                  }
              }
              dynamic "encryption_configuration" {
                for_each = destination.value.encryption_configuration
                  content {
                    replica_kms_key_id = encryption_configuration.value["replica_kms_key_id"]
                  }
              }
              dynamic "metrics" {
                for_each = destination.value.metrics
                  content {
                    status = metrics.value["status"]
                    dynamic "event_threshold" {
                      for_each = metrics.value.event_threshold
                        content {
                          minutes = event_threshold.value["minutes"] 
                        }
                    }
                  }
              }
              dynamic "replication_time" {
                for_each = destination.value.replication_time
                  content {
                    status = replication_time.value["status"]
                    dynamic "time" {
                      for_each = replication.value.time
                        content {
                          minutes = time.value["minutes"]
                        }
                    } 
                  }
              }
            }
        }
        dynamic "existing_object_replication" {
          for_each = ruke.value.existing_object_replication
            content {
              status = existing_object_replication.value["status"]
            }
        }
        dynamic "filter" {
          for_each = rule.value.filter
            content {
              prefix  = filter.value["prefix"]
              dynamic "and" {
                for_each = filter.value.and
                  content {
                    prefix = and.value["prefix"]
                    tags   = and.value["tags"]
                  }
              }
              dynamic "tag" {
                for_each = filter.value.tags
                  content {
                    key   = tag.value["key"]
                    value = tag.value["value"]
                  }
              }
            }
        }
        dynamic "source_selection_criteria" {
          for_each = rule.value.source_selection_criteria
            content {
              dynamic "replica_modifications" {
                for_each = source_selection_criteria.value.replica_modifications
                  content {
                    status = replica_modifications.value["status"]
                  }
              }
              dynamic "sse_kms_encrypted_object" {
                for_each = source_selection_criteria.value.sse_kms_encrypted_object
                  content {
                    status = sse_kms_encrypted_object.value["status"] 
                  }
              }
            }
        }
      }
  }
}
