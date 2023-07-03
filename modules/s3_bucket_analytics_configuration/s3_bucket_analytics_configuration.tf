resource "aws_s3_bucket_analytics_configuration" "s3_bucket_analytics_configuration" {
  bucket = var.s3_bucket_analytics_configuration_bucket
  name   = var.s3_bucket_analytics_configuration_name


  dynamic "filter" {
    for_each = var.s3_bucket_analytics_configuration_filter
      content {
        prefix = filter.value["prefix"]
        tags   = filter.value["tags"]
      }
  }
  dynamic "storage_class_analysis" {
    for_each = var.s3_bucket_analytics_configuration_storage_class_analysis
      content {
        dynamic "data_export" {
          for_each = storage_class_analysis.value.data_export
            content {
              output_schema_version = data_export.value["output_schema_version"]
              dynamic "destination" {
                content {
                  dynamic "s3_bucket_destination" {
                    content {
                      bucket_arn        = s3_bucket_destination.value["bucket_arn"]
                      bucket_account_id = s3_bucket_destination.value["bucket_account_id"] 
                      format            = s3_bucket_destination.value["format"]
                      prefix            = s3_bucket_destination.value["prefix"]
                    }
                  }
                }
              }
            }
        }
      }
  }
}
