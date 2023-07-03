resource "aws_s3_bucket_lifecycle_configuration" "s3_bucket_lifecycle_configuration" {
  bucket                = var.s3_bucket_lifecycle_configuration_bucket
  expected_bucket_owner = var.s3_bucket_lifecycle_configuration_expected_bucket_owner

  dynamic "rule" { 
    for_each = var.s3_bucket_lifecycle_configuration_rule
      content {
        id     = rule.value["id"]
        status = rule.value["status"]
        dynamic "abort_incomplete_multipart_upload" {
          for_each = rule.value.abort_incomplete_multipart_upload
            content {
              days_after_initiation = abort_incomplete_multipart_upload.value["days_after_initiation"]
            }
        }
        dynamic "expiration" {
          for_each = rule.value.expiration 
            content {
              date                         = expiration.value["date"]
              days                         = expiration.value["days"]
              expired_object_delete_marker = expiration.value["expired_object_delete_marker"] 
            }
        }
        dynamic "filter" {
          for_each = rule.value.filter
            content {
              object_size_greater_than = filter.value["object_size_greater_than"]
              object_size_less_than    = filter.value["object_size_less_than"]
              prefix                   = filter.value["prefix"]
              dynamic "and" {
                for_each = filter.value.and
                  content {
                    object_size_greater_than = and.value["object_size_greater_than"]
                    object_size_less_than    = and.value["object_size_less_than"]
                    prefix                   = and.value["prefix"]
                    tags                     = and.value["tags"]
                  }
              }
              dynamic "tags" {
                for_each = filter.value.tags
                  content {
                    key   = tags.value["key"]
                    value = tags.value["value"]
                  }
              }
            }
        }
        dynamic "noncurrent_version_expiration" {
          for_each = rule.value.noncurrent_version_expiration
            content {
              newer_noncurrent_versions = noncurrent_version_expiration.value["newer_noncurrent_versions"]
              noncurrent_days           = noncurrent_version_expiration.value["noncurrent_days"]
            }
        }
        dynamic "noncurrent_version_transition" {
          for_each = rule.value.noncurrent_version_transition
            content {
              newer_noncurrent_versions = noncurrent_version_transition.value["newer_noncurrent_versions"]
              noncurrent_days           = noncurrent_version_transition.value["noncurrent_days"]
              storage_class             = noncurrent_version_transition.value["storage_class"]
            }
        }
        dynamic "transition" {
          for_each = rule.value.transition
            content {
              date          = transition.value["date"]
              days          = transition.value["days"]
              storage_class = transition.value["storage_class"] 
            }
        }
      }
  }
}
