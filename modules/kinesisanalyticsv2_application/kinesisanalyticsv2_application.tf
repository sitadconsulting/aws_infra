resource "aws_kinesisanalyticsv2_application" "kinesisanalyticsv2_application" {
  description            = var.kinesisanalyticsv2_application_description
  force_stop             = var.kinesisanalyticsv2_application_force_stop
  name                   = var.kinesisanalyticsv2_application_name
  runtime_environment    = var.kinesisanalyticsv2_application_runtime_environment
  service_execution_role = var.kinesisanalyticsv2_application_service_execution_role
  start_application      = var.kinesisanalyticsv2_application_start_application
  tags                   = var.kinesisanalyticsv2_application_tags

  dynamic "application_configuration" {
    for_each = var.kinesisanalyticsv2_application_application_configuration
      content {
        dynamic "application_code_configuration" {
          for_each = application_configuration.value.application_code_configuration
            content {
              code_content_type = application_code_configuration.value["code_content_type"]
              dynamic "code_content" {
                for_each = application_code_configuration.value.code_content
                  content {
                    text_content = code_content.value["text_content"]
                    dynamic "s3_content_location" {
                      for_each = code_content.value.s3_content_location
                        content {
                          bucket_arn     = s3_content_location.value["bucket_arn"]
                          file_key       = s3_content_location.value["file_key"]
                          object_version = s3_content_location.value["object_version"]
                        }
                    }
                  }
              }
            }
        }
        dynamic "application_snapshot_configuration" {
          for_each = application_configuration.value.application_snapshot_configuration
            content {
              snapshots_enabled = application_snapshot_configuration.value["snapshots_enabled"]
            }
        }
        dynamic "environment_properties" {
          for_each = application_configuration.value.environment_properties
            content {
              dynamic "property_group" {
                for_each = environment_properties.value.property_group
                  content {
                    property_group_id = property_group.value["property_group_id"]
                    property_map      = property_group.value["property_map"]
                  }
              }
            }
        }
        dynamic "flink_application_configuration" {
          for_each = application_configuration.value.flink_application_configuration
            content {
              dynamic "checkpoint_configuration" {
                for_each = flink_application_configuration.value.checkpoint_configuration
                  content {
                    checkpointing_enabled         = checkpoint_configuration.value["checkpointing_enabled"]
                    checkpoint_interval           = checkpoint_configuration.value["checkpoint_interval"]
                    configuration_type            = checkpoint_configuration.value["configuration_type"]
                    min_pause_between_checkpoints = checkpoint_configuration.value["min_pause_between_checkpoints"]
                  }
              }
              dynamic "monitoring_configuration" {
                for_each = flink_application_configuration.value.monitoring_configuration
                  content {
                    configuration_type = monitoring_configuration.value["configuration_type"]
                    log_level          = monitoring_configuration.value["log_level"]
                    metrics_level      = monitoring_configuration.value["metrics_level"]
                  }
              }
              dynamic "parallelism_configuration" {
                for_each = flink_application_configuration.value.parallelism_configuration
                  content {
                    auto_scaling_enabled = parallelism_configuration.value["auto_scaling_enabled"]
                    configuration_type   = parallelism_configuration.value["configuration_type"]
                    parallelism          = parallelism_configuration.value["parallelism"]
                    parallelism_per_kpu  = parallelism_configuration.value["parallelism_per_kpu"]
                  }
              }
            }
        }
        dynamic "run_configuration" {
          for_each = application_configuration.value.run_configuration
            content {
              dynamic "application_restore_configuration" {
                for_each = run_configuration.value.application_restore_configuration
                  content {
                    application_restore_type = application_restore_configuration.value["application_restore_type"]
                    snapshot_name            = application_restore_configuration.value["snapshot_name"]
                  }
              } 
              dynamic "flink_run_configuration" {
                for_each = run_configuration.value.flink_run_configuration
                  content {
                    allow_non_restored_state = flink_run_configuration.value["allow_non_restored_state"]
                  }
              }
            }
        }
        dynamic "sql_application_configuration" {
          for_each = application_configuration.value.sql_application_configuration
            content {
              dynamic "input" {
                for_each = sql_application_configuration.value.input
                  content {
                    name_prefix = input.value["name_prefix"]
                    dynamic "input_parallelism" {
                      for_each = input.value.input_parallelism
                        content {
                          count = input_parallelism.value["count"]
                        }
                    } 
                    dynamic "input_processing_configuration" {
                      for_each = input.value.input_processing_configuration
                        content {
                          dynamic "input_lambda_processor" {
                            for_each = input_processing_configuration.value.input_lambda_processor
                              content {
                                resource_arn = input_lambda_processor.value["resource_arn"] 
                              }
                          }
                        } 
                    }
                    dynamic "input_schema" {
                      for_each = input.value.input_schema
                        content {
                          record_encoding = input_schema.value["record_encoding"]
                          dynamic "record_column" {
                            for_each = input_schema.value.record_column
                              content {
                                mapping  = record_column.value["mapping"]
                                name     = record_column.value["name"]
                                sql_type = frecord_column.value["sql_type"]
                              }
                          }
                          dynamic "record_format" {
                            for_each = input_schema.value.record_format
                              content {
                                record_format_type = record_format.value["record_format_type"]
                                dynamic "mapping_parameters" {
                                  for_each = record_format.value.mapping_parameters
                                    content {
                                      dynamic "csv_mapping_parameters" {
                                        for_each = mapping_parameters.value.csv_mapping_parameters
                                          content {
                                            record_column_delimiter = csv_mapping_parameters.value["record_column_delimiter"]
                                            record_row_delimiter    = csv_mapping_parameters.value["record_row_delimiter"]
                                          }
                                      }
                                      dynamic "json_mapping_parameters" {
                                        for_each = mapping_parameters.value.json_mapping_parameters
                                          content {
                                            record_row_path = json_mapping_parameters.value["record_row_path"]
                                          }
                                      }
                                    }
                                }
                              }
                          }
                        }
                    }
                    dynamic "input_starting_position_configuration" {
                      for_each = input.value.input_starting_position_configuration
                        content {
                          input_starting_position = input_starting_position_configuration.value["input_starting_position"]
                        }
                    }
                    dynamic "kinesis_firehose_input" {
                      for_each = input.value.kinesis_firehose_input
                        content {
                          resource_arn = kinesis_firehose_input.value["resource_arn"]
                        }
                    }
                    dynamic "kinesis_stream_input" {
                      for_each = input.value.kinesis_stream_input
                        content {
                          resource_arn = kinesis_stream_input.value["resource_arn"]
                        }
                    }
                  }
              }
              dynamic "output" {
                for_each = sql_application_configuration.value.output
                  content {
                    name = output.value["name"]
                    dynamic "destination_schema" {
                      for_each = output.value.destination_schema
                        content {
                          record_format_type = destination_schema.value["record_format_type"]
                        }
                    }
                    dynamic "kinesis_firehose_output" {
                      for_each = output.value.kinesis_firehose
                        content {
                          resource_arn = kinesis_firehose.value["resource_arn"]
                        }
                    }
                    dynamic "kinesis_stream_output" {
                      for_each = output.value.kinesis_stream_output
                        content {
                          resource_arn = kinesis_stream_output.value["resource_arn"]
                        }
                    }
                    dynamic "lambda_output" {
                      for_each = output.value.lambda_output
                        content {
                          resource_arn = lambda_output.value["resource_arn"]
                        }
                    }
                  }
              }
              dynamic "reference_data_source" {
                for_each = sql_application_configuration.value.reference_data_source
                  content {
                    table_name = reference_data_source.value["table_name"]
                    dynamic "reference_schema" {
                      for_each = reference_data_source.value.reference_schema
                        content {
                          record_encoding = reference_schema.value["record_encoding"]
                          dynamic "record_column" {
                            for_each = reference_schema.value.record_column
                              content {
                                mapping  = record_column.value["mapping"]
                                name     = record_column.value["name"]
                                sql_type = record_column.value["sql_type"]
                              }
                          }   
                          dynamic "record_format" {
                            for_each = reference_schema.value.record_format
                              content {
                                record_format_type = string
                                dynamic "mapping_parameters" {
                                  for_each = record_format.value.mapping_parameters
                                    content {
                                      dynamic "csv_mapping_parameters" { 
                                        for_each = mapping_parameters.value.csv_mapping_parameters
                                          content {
                                            record_column_delimiter = csv_mapping_parameters.value["record_column_delimiter"]
                                            record_row_delimiter    = csv_mapping_parameters.value["record_row_delimiter"]
                                          }
                                      }
                                      dynamic "json_mapping_parameters" {
                                        for_each = mapping_parameters.value.json_mapping_parameters
                                          content {
                                            record_row_path = json_mapping_parameters.value["record_row_path"]
                                          }
                                      } 
                                    }
                                }  
                          
                              }
                          }
                        }
                    }
                    dynamic "s3_reference_data_source" {
                      for_each = reference_data_source.value.s3_reference_data_source
                        content {
                          bucket_arn = s3_reference_data_source.value["bucket_arn"]
                          file_key   = s3_reference_data_source.value["file_key"]
                        }
                    }
                  }
              }
            }
        }
        dynamic "vpc_configuration" {
          for_each = application_configuration.value.vpc_configuration
            content {
              security_group_ids = vpc_configuration.value["security_group_ids"]
              subnet_ids         = vpc_configuration.value["subnet_ids"]
            }
        }
      }
  }
  dynamic "cloudwatch_logging_options" {
    for_each = var.kinesisanalyticsv2_application_application_cloudwatch_logging_options
      content {
        log_stream_arn = cloudwatch_logging_options.value["log_stream_arn"] 
      }
  }
}


