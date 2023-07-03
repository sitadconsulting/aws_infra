resource "aws_kinesis_analytics_application" "kinesis_analytics_application" {
  code              = var.kinesis_analytics_application_code
  description       = var.kinesis_analytics_application_description
  name              = var.kinesis_analytics_application_name
  start_application = var.kinesis_analytics_application_start_application
  tags              = var.kinesis_analytics_application_tags
  

  dynamic "cloudwatch_logging_options" {
    for_each = var.kinesis_analytics_application_cloudwatch_logging_options
      content {
        log_stream_arn = cloudwatch_logging_options.value["log_stream_arn"]
        role_arn       = cloudwatch_logging_options.value["role_arn"]
      }
  }
  dynamic "inputs" {
    for_each = var.kinesis_analytics_application_inputs
      content {
        name_prefix = inputs.value["name_prefix"]
        dynamic "kinesis_firehose" {
          for_each = inputs.value.kinesis_firehose
            content {
              resource_arn = kinesis_firehose.value["resource_arn"]
              role_arn     = kinesis_firehose.value["role_arn"]
            }
        }
        dynamic "kinesis_stream" {
          for_each = inputs.value.kinesis_stream
            content {
              resource_arn = kinesis_stream.value["resource_arn"]
              role_arn     = kinesis_stream.value["role_arn"]
            }
        }
        dynamic "parallelism" {
          for_each = inputs.value.parallelism
            content {
              count = parallelism.value["count"]
            }
        }
        dynamic "processing_configuration" {
          for_each = inputs.value.processing_configuration
            content {
              dynamic "lambda" {
                for_each = processing_configuration.value.lambda
                  content {
                    resource_arn = lambda.value["resource_arn"]
                    role_arn     = lambda.value["role_arn"]
                  }
              }
            }
        }
        dynamic "schema" {
          for_each = inputs.value.schema
            content {
              record_encoding = schema.value["record_encoding"]
              dynamic "record_columns" {
                for_each = schema.value.record_columns
                  content {
                    name     = record_columns.value["name"]
                    sql_type = record_columns.value["sql_type"]
                    mapping  = record_columns.value["mapping"] 
                  }
              }
              dynamic "record_format" {
                for_each = schema.value.record_format
                  content {
                    record_format_type = record_format.value["record_format_type"]
                    dynamic "mapping_parameters" {
                      for_each = record_format.value.mapping_parameters
                        content {
                          dynamic "csv" {
                            for_each = mapping_parameters.value.csv
                              content {
                                record_column_delimiter = csv.value["record_column_delimiter"]
                                record_row_delimiter    = csv.value["record_row_delimiter"]
                              }
                          }
                          dynamic "json" {
                            for_each = mapping_parameters.value.json
                              content {
                                record_row_path = json.value["record_row_path"]
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "starting_position_configuration" {
          for_each = inputs.value.starting_position_configuration
            content {
              starting_position = starting_position_configuration.value["starting_position"]
            }
        }
      }
  }
  dynamic "outputs" {
    for_each = var.kinesis_analytics_application_outputs
      content {
        name = outputs.value["name"]
        dynamic "kinesis_firehose" {
          for_each = outputs.value.kinesis_firehose
            content {
              resource_arn = kinesis_firehose.value["resource_arn"]
              role_arn     = kinesis_firehose.value["role_arn"]
            }
        }
        dynamic "kinesis_stream" {
          for_each = outputs.value.kinesis_stream
            content {
              resource_arn = kinesis_stream.value["resource_arn"]
              role_arn     = kinesis_stream.value["role_arn"]
            }
        }
        dynamic "lambda" {
          for_each = outputs.value.lambda 
            content {
              resource_arn = lambda.value["resource_arn"]
              role_arn     = lambda.value["role_arn"]
              
            }
        }
        dynamic "schema" {
          for_each = outputs.value.schema
            content {
              record_format_type = schema.value["record_format_type"]
            } 
        }
      }
  }
  dynamic "reference_data_sources" {
    for_each = var.kinesis_analytics_application_reference_data_sources
      content {
        table_name  = reference_data_sources.value["table_name"]
        dynamic "s3" {
          for_each = reference_data_sources.value.s3
            content {
              bucket_arn = s3.value["bucket_arn"]
              file_key   = s3.value["file_key"]
              role_arn   = s3.value["role_arn"]
            }
        }
        dynamic "schema" {
          for_each = reference_data_sources.value.schema 
            content {
              record_encoding = schema.value["record_encoding"]
              dynamic "record_columns" {
                for_each = schema.value.record_columns
                  content {
                    name     = record_columns.value["name"]
                    sql_type = record_columns.value["sql_type"]
                    mapping  = record_columns.value["mapping"]
                  }
              }
              dynamic "record_format" {
                for_each = schema.value.record_format
                  content {
                    record_format_type = record_format.value["record_format_type"]
                    dynamic "mapping" {
                      for_each = record_format.value.mapping
                        content {
                          dynamic "csv" {
                            for_each = mapping.value.csv
                              content {
                                record_column_delimiter = csv.value["record_column_delimiter"]
                                record_row_delimiter    = csv.value["record_row_delimiter"]
                              }
                          }
                          dynamic "json" {
                            for_each = mapping.value.json
                              content {
                                record_row_path = json.value["record_row_path"]
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
      }
  }
}

