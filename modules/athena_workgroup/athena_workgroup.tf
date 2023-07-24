resource "aws_athena_workgroup" "athena_workgroup" {
  description   = var.athena_workgroup_description
  force_destroy = var.athena_workgroup_force_destroy
  name          = var.athena_workgroup_name
  state         = var.athena_workgroup_state
  tags          = var.athena_workgroup_tags
  

  dynamic "configuration" {
    for_each = var.athena_workgroup_configuration
      content {
        bytes_scanned_cutoff_per_query     = configuration.value["bytes_scanned_cutoff_per_query"]
        enforce_workgroup_configuration    = configuration.value["enforce_workgroup_configuration"]
        execution_role                     = configuration.value["execution_role"]
        publish_cloudwatch_metrics_enabled = configuration.value["publish_cloudwatch_metrics_enabled"]
        requester_pays_enabled             = configuration.value["requester_pays_enabled"]
        dynamic "engine_version" {
          for_each = configuration.value.engine_version
            content {
              selected_engine_version  = engine_version.value["selected_engine_version"]
            }
        }
        dynamic "result_configuration" {
          for_each = configuration.value.result_configuration
            content {
              expected_bucket_owner = result_configuration.value["expected_bucket_owner"]
              output_location       = result_configuration.value["output_location"]
              dynamic "acl_configuration" {
                for_each = result_configuration.value.acl_configuration
                  content {
                    s3_acl_option = acl_configuration.value["s3_acl_option"]
                  }
              }
              dynamic "encryption_configuration" {
                for_each = result_configuration.value.encryption_configuration
                  content {
                    encryption_option = encryption_configuration.value["encryption_option"]
                    kms_key_arn       = encryption_configuration.value["kms_key_arn"]
                  }
              }
            }
        }
      }
  }
  lifecycle {
    ignore_changes = all
  }
}
