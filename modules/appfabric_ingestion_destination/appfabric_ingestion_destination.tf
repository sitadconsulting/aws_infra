resource "aws_appfabric_ingestion_destination" "appfabric_ingestion_destination" {
  app_bundle_arn = var.appfabric_ingestion_destination_app_bundle_arn
  ingestion_arn  = var.appfabric_ingestion_destination_ingestion_arn 
  tags           = var.appfabric_ingestion_destination_tags

  dynamic "destination_configuration " {
    for_each = var.appfabric_ingestion_destination_destination_configuration
      content {
        dynamic "audit_log" {
          for_each = destination_configuration.value.audit_log
            content {
              dynamic "destination" {
                for_each = audit_log.value.destination
                  content {
                    dynamic "firehose_stream" {
                      for_each = destination.value.firehose_stream
                        content {
                          stream_name = firehose_stream.value["stream_name"]
                        }
                    }
                    dynamic "s3_bucket" {
                      for_each = destination.value.s3_bucket
                        content {
                          bucket_name = s3_bucket.value["bucket_name"]
                          prefix      = s3_bucket.value["prefix"]
                        }
                    }
                  }
              }
            }
        }
      }
  }
  dynamic "processing_configuration" {
    for_each = var.appfabric_ingestion_destination_processing_configuration
      content {
        dynamic "audit_log" {
          for_each = processing_configuration.value.audit_log
            content {
              format = audit_log.value["format"]
              schema = audit_log.value["schema"]
            }
        }
      }
  }
}
