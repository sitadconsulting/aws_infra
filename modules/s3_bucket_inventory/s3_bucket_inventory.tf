resource "aws_s3_bucket_inventory" "s3_bucket_inventory" {
  bucket                   = var.s3_bucket_inventory_bucket
  enabled                  = var.s3_bucket_inventory_enabled
  included_object_versions = var.s3_bucket_inventory_included_object_versions 
  name                     = var.s3_bucket_inventory_name
  optional_fields          = var.s3_bucket_inventory_optional_fields


  dynamic "destination" {
    for_each = var.s3_bucket_inventory_destination
      content {
        dynamic "bucket" {
          for_each = destination.value.bucket
            content {
              account_id = bucket.value["account_id"]
              bucket_arn = bucket.value["bucket_arn"]
              format     = bucket.value["format"]
              prefix     = backet.value["prefix"]
              dynamic "encryption" {
                for_each = bucket.value.encryption
                  content {
                    sse_s3 = encryption.value["sse_s3"]
                    dynamic "sse_kms" {
                      for_each = encryption.value.sse_kms
                        content {
                          key_id = sse_kms.value["key_id"]
                        }
                    }
                  }
              }
            }
        }  
      }
  }
  dynamic "filter" {
    for_each = var.s3_bucket_inventory_filter
      content {
        prefix = filter.value["prefix"]
      }
  }
  dynamic "schedule" {
    for_each = var.s3_bucket_inventory_schedule
      content {
        frequency = schedule.value["frequency"]
      }
  }
}
