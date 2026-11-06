resource "aws_bcmdataexports_export" "bcmdataexports_export" {
  tags = var.bcmdataexports_export_tags


  dynamic "export" {
    for_each = var.bcmdataexports_export_export
      content {
        description = export.value["description"]
        name        = export.value["name"]
        dynamic "data_query" {
          for_each = export.value.data_query
            content {
              query_statement      = data_query.value["query_statement"]
              table_configurations = data_query.value["table_configurations"]
            }
        }
        dynamic "destination_configurations" {
          for_each = export.value.destination_configurations
            content {
              dynamic "s3_destination" {
                for_each = destination_configurations.value.s3_destination
                  content {
                    s3_bucket       = s3_destination.value["s3_bucket"]
                    s3_bucket_owner = s3_destination.value["s3_bucket_owner"]
                    s3_prefix       = s3_destination.value["s3_prefix"]
                    s3_region       = s3_destination.value["s3_region"]
                    dynamic "s3_output_configurations" {
                      for_each = s3_destination.value.s3_output_configurations
                        content {
                          compression = s3_output_configurations.value["compression"]
                          format      = s3_output_configurations.value["format"]
                          output_type = s3_output_configurations.value["output_type"]
                          overwrite   = s3_output_configurations.value["overwrite"]
                        }
                    }
                  }
              }
            }
        }
        dynamic "refresh_cadence" {
          for_each = export.value.refresh_cadence
            content {
              frequency = refresh_cadence.value["frequency"]
            }
        }
      }
  }
}
