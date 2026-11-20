resource "aws_pipes_pipe" "pipes_pipe" {
  description        = var.pipes_pipe_description
  desired_state      = var.pipes_pipe_desired_state
  enrichment         = var.pipes_pipe_enrichment
  kms_key_identifier = var.pipes_pipe_kms_key_identifier
  name               = var.pipes_pipe_name
  name_prefix        = var.pipes_pipe_name_prefix
  role_arn           = var.pipes_pipe_role_arn
  source             = var.pipes_pipe_source
  tags               = var.pipes_pipe_tags
  target             = var.pipes_pipe_target

  dynamic "enrichment_parameters" {
    for_each = var.pipes_pipe_enrichment_parameters
      content {
        input_template = enrichment_parameters.value["input_template"]
        dynamic "http_parameters" {
          for_each = enrichment_parameters.value.http_parameters
            content {
              header_parameters       = http_parameters.value["header_parameters"]
              path_parameter_values   = http_parameters.value["path_parameter_values"]
              query_string_parameters = http_parameters.value["query_string_parameters"]
            }
        }
      }
  }
  dynamic "log_configuration" {
    for_each = var.pipes_pipe_log_configuration
      content {
        include_execution_data = log_configuration.value["include_execution_data"]
        level                  = log_configuration.value["level"]
        dynamic "cloudwatch_logs_log_destination" {
          for_each = log_configuration.value.cloudwatch_logs_log_destination
            content {
              log_group_arn = cloudwatch_logs_log_destination.value["log_group_arn"]
            }
        }
        dynamic "firehose_log_destination" {
          for_each = log_configuration.value.firehose_log_destination
            content {
              delivery_stream_arn = firehose_log_destination.value["delivery_stream_arn"]
            }
        }
        dynamic "s3_log_destination" {
          for_each = log_configuration.value.s3_log_destination
            content {
              bucket_name   = s3_log_destination.value["bucket_name"]
              bucket_owner  = s3_log_destination.value["bucket_owner"]
              output_format = s3_log_destination.value["output_format"]
              prefix        = s3_log_destination.value["prefix"]
            }
        }
      }
  }
  dynamic "source_parameters" {
    for_each = var.pipes_pipe_source_parameters
      content {
        dynamic "activemq_broker_parameters" {
          for_each = source_parameters.value.activemq_broker_parameters
            content {
              batch_size                         = activemq_broker_parameters.value["batch_size"]
              maximum_batching_window_in_seconds = activemq_broker_parameters.value["maximum_batching_window_in_seconds"]
              queue_name                         = activemq_broker_parameters.value["queue_name"]
              dynamic "credentials" {
                for_each = activemq_broker_parameters.value.credentials
                  content {
                    basic_auth = credentials.value["basic_auth"]
                  }
              }
            }
        }
        dynamic "dynamodb_stream_parameters" {
          for_each = source_parameters.value.dynamodb_stream_parameters
            content {
              batch_size                         = dynamodb_stream_parameters.value["batch_size"]
              maximum_batching_window_in_seconds = dynamodb_stream_parameters.value["maximum_batching_window_in_seconds"]
              maximum_record_age_in_seconds      = dynamodb_stream_parameters.value["maximum_record_age_in_seconds"]
              maximum_retry_attempts             = dynamodb_stream_parameters.value["maximum_retry_attempts"]
              on_partial_batch_item_failure      = dynamodb_stream_parameters.value["on_partial_batch_item_failure"]
              parallelization_factor             = dynamodb_stream_parameters.value["parallelization_factor"]
              starting_position                  = dynamodb_stream_parameters.value["starting_position"]
              dynamic "dead_letter_config" {
                for_each = dynamodb_stream_parameters.value.dead_letter_config
                  content {
                    arn = dead_letter_config.value["arn"]
                  }
              }
            }
        }
        dynamic "filter_criteria" {
          for_each = source_parameters.value.filter_criteria
            content {
              dynamic "filter" {
                for_each = filter_criteria.value.filter
                  content {
                    pattern = filter.value["pattern"]
                  }
              }
            }
        }
        dynamic "kinesis_stream_parameters" {
          for_each = source_parameters.value.kinesis_stream_parameters
            content {
              batch_size                         = kinesis_stream_parameters.value["batch_size"]
              maximum_batching_window_in_seconds = kinesis_stream_parameters.value["maximum_batching_window_in_seconds"]
              maximum_record_age_in_seconds      = kinesis_stream_parameters.value["maximum_record_age_in_seconds"]
              maximum_retry_attempts             = kinesis_stream_parameters.value["maximum_retry_attempts"]
              on_partial_batch_item_failure      = kinesis_stream_parameters.value["on_partial_batch_item_failure"]
              parallelization_factor             = kinesis_stream_parameters.value["parallelization_factor"]
              starting_position                  = kinesis_stream_parameters.value["starting_position"]
              starting_position_timestamp        = kinesis_stream_parameters.value["starting_position_timestamp"]
              dynamic "dead_letter_config" {
                for_each = kinesis_stream_parameters.value.dead_letter_config
                  content {
                    arn = dead_letter_config.value["arn"]
                  }
              }
            }
        }
        dynamic "managed_streaming_kafka_parameters" {
          for_each = source_parameters.value.managed_streaming_kafka_parameters
            content {
              batch_size                         = managed_streaming_kafka_parameters.value["batch_size"]
              consumer_group_id                  = managed_streaming_kafka_parameters.value["consumer_group_id"]
              maximum_batching_window_in_seconds = managed_streaming_kafka_parameters.value["maximum_batching_window_in_seconds"]
              starting_position                  = managed_streaming_kafka_parameters.value["starting_position"]
              topic_name                         = managed_streaming_kafka_parameters.value["topic_name"]
              dynamic "credentials" {
                for_each = managed_streaming_kafka_parameters.value.credentials
                  content {
                    client_certificate_tls_auth = credentials.value["client_certificate_tls_auth"]
                    sasl_scram_512_auth         = credentials.value["sasl_scram_512_auth"]
                  }
              }
            }
        }
        dynamic "rabbitmq_broker_parameters" {
          for_each = source_parameters.value.rabbitmq_broker_parameters
            content {
              batch_size                         = rabbitmq_broker_parameters.value["batch_size"]
              maximum_batching_window_in_seconds = rabbitmq_broker_parameters.value["maximum_batching_window_in_seconds"]
              queue_name                         = rabbitmq_broker_parameters.value["queue_name"]
              virtual_host                       = rabbitmq_broker_parameters.value["virtual_host"]
              dynamic "credentials" {
                for_each = rabbitmq_broker_parameters.value.credentials
                  content {
                    basic_auth = credentials.value["basic_auth"]
                  }
              }
            }
        }
        dynamic "self_managed_kafka_parameters" {
          for_each = source_parameters.value.self_managed_kafka_parameters
            content {
              additional_bootstrap_servers       = self_managed_kafka_parameters.value["additional_bootstrap_servers"]
              batch_size                         = self_managed_kafka_parameters.value["batch_size"]
              consumer_group_id                  = self_managed_kafka_parameters.value["consumer_group_id"]
              maximum_batching_window_in_seconds = self_managed_kafka_parameters.value["maximum_batching_window_in_seconds"]
              server_root_ca_certificate         = self_managed_kafka_parameters.value["server_root_ca_certificate"]
              starting_position                  = self_managed_kafka_parameters.value["starting_position"]
              topic_name                         = self_managed_kafka_parameters.value["topic_name"]
              dynamic "credentials" {
                for_each = self_managed_kafka_parameters.value.credentials
                  content {
                    basic_auth                  = credentials.value["basic_auth"]
                    client_certificate_tls_auth = credentials.value["client_certificate_tls_auth"]
                    sasl_scram_256_auth         = credentials.value["sasl_scram_256_auth"]
                    sasl_scram_512_auth         = credentials.value["sasl_scram_512_auth"]
                  }
              }
              dynamic "vpc" {
                for_each = self_managed_kafka_parameters.value.vpc
                  content {
                    security_groups = vpc.value["security_groups"]
                    subnets         = vpc.value["subnets"]
                  }
              }
            }
        }
        dynamic "sqs_queue_parameters" {
          for_each = source_parameters.value.sqs_queue_parameters
            content {
              batch_size                         = sqs_queue_parameters.value["batch_size"]
              maximum_batching_window_in_seconds = sqs_queue_parameters.value["maximum_batching_window_in_seconds"]
            }
        }
      }
  }
  dynamic "target_parameters" {
    for_each = var.pipes_pipe_target_parameters
      content {
        input_template = target_parameters.value["input_template"]
        dynamic "batch_job_parameters" {
          for_each = target_parameters.value.batch_job_parameters
            content {
              job_definition      = batch_job_parameters.value["job_definition"]
              job_name            = batch_job_parameters.value["job_name"]
              parameters          = batch_job_parameters.value["parameters"]   
              dynamic "array_properties" {
                for_each = batch_job_parameters.value.array_properties
                  content {
                    size = array_properties.value["size"]
                  }
              }
              dynamic "container_overrides" {
                for_each = batch_job_parameters.value.container_overrides
                  content {
                    command       = container_overrides.value["command"]
                    instance_type = container_overrides.value["instance_type"]
                    dynamic "environment" {
                      for_each = container_overrides.value.environment
                        content {
                          name  = environment.value["name"]
                          value = environment.value["value"]
                        }
                    }
                    dynamic "resource_requirement" {
                      for_each = container_overrides.value.resource_requirement
                        content {
                          type  = resource_requirement.value["type"]
                          value = resource_requirement.value["value"]
                        }
                    }
                  }
              }
              dynamic "depends_on" {
                for_each = batch_job_parameters.value.depends_on
                  content {
                    job_id = depends_on.value["job_id"]
                    type   = depends_on.value["type"]
                  }
              }
              dynamic "retry_strategy" {
                for_each = batch_job_parameters.value.retry_strategy
                  content {
                    attempts = retry_strategy.value["attempts"]
                  }
              }
            }
        }
        dynamic "cloudwatch_logs_parameters" {
          for_each = target_parameters.value.cloudwatch_logs_parameters
            content {
              log_stream_name = cloudwatch_logs_parameters.value["log_stream_name"]
              timestamp       = cloudwatch_logs_parameters.value["timestamp"]
            }
        }
        dynamic "ecs_task_parameters" {
          for_each = target_parameters.value.ecs_task_parameters
            content {
              enable_ecs_managed_tags    = ecs_task_parameters.value["enable_ecs_managed_tags"]
              enable_execute_command     = ecs_task_parameters.value["enable_execute_command"]
              group                      = ecs_task_parameters.value["group"]
              launch_type                = ecs_task_parameters.value["launch_type"]
              platform_version           = ecs_task_parameters.value["platform_version"]
              propagate_tags             = ecs_task_parameters.value["propagate_tags"]
              reference_id               = ecs_task_parameters.value["reference_id"]
              tags                       = ecs_task_parameters.value["tags"]
              task_count                 = ecs_task_parameters.value["task_count"]
              task_definition_arn        = ecs_task_parameters.value["task_definition_arn"]
              dynamic "capacity_provider_strategy" {
                for_each = ecs_task_parameters.value.capacity_provider_strategy
                  content {
                    base              = capacity_provider_strategy.value["base"]
                    capacity_provider = capacity_provider_strategy.value["capacity_provider"]
                    weight            = capacity_provider_strategy.value["weight"]
                  }
              }
              dynamic "network_configuration" {
                for_each = ecs_task_parameters.value.network_configuration
                  content {
                    dynamic "aws_vpc_configuration" {
                      for_each = network_configuration.value.aws_vpc_configuration
                        content {
                          assign_public_ip = aws_vpc_configuration.value["assign_public_ip"]
                          security_groups  = aws_vpc_configuration.value["security_groups"]
                          subnets          = aws_vpc_configuration.value["subnets"]
                        } 
                    }
                  }
              }
              dynamic "overrides" {
                for_each = ecs_task_parameters.value.overrides
                  content {
                    cpu                = overrides.value["cpu"]
                    execution_role_arn = overrides.value["execution_role_arn"]
                    memory             = overrides.value["memory"]
                    task_role_arn      = overrides.value["task_role_arn"]
                    dynamic "container_override" {
                      for_each = overrides.value.container_override
                        content {
                          command              = container_override.value["command"]
                          cpu                  = container_override.value["cpu"]
                          memory               = container_override.value["memory"]
                          memory_reservation   = container_override.value["memory_reservation"]
                          name                 = container_override.value["name"]
                          dynamic "environment" {
                            for_each = container_override.value.environment
                              content {
                                name  = environment.value["name"]
                                value = environment.value["value"]
                              }
                          }
                          dynamic "environment_file" {
                            for_each = container_override.value.environment_file
                              content {
                                type  = environment_file.value["type"]
                                value = environment_file.value["value"]
                              }
                          }
                          dynamic "resource_requirement" {
                            for_each = container_override.value.resource_requirement
                              content {
                                type  = resource_requirement.value["type"]
                                value = resource_requirement.value["value"]
                              }
                          }
                        }
                    }             
                    dynamic "ephemeral_storage" {
                      for_each = overrides.value.ephemeral_storage
                        content {
                          size_in_gib = ephemeral_storage.value["size_in_gib"]
                        }
                    }
                    dynamic "inference_accelerator_override" {
                      for_each = overrides.value.inference_accelerator_override
                        content {
                          device_name = inference_accelerator_override.value["device_name"]
                          device_type = inference_accelerator_override.value["device_type"]
                        }
                    }
                  }
              }
              dynamic "placement_constraint" {
                for_each = ecs_task_parameters.value.placement_constraint
                  content {
                    expression = placement_constraint.value["expression"]
                    type       = placement_constraint.value["type"]
                  }
              }
              dynamic "placement_strategy" {
                for_each = ecs_task_parameters.value.placement_strategy
                  content {
                    field = placement_strategy.value["field"]
                    type  = placement_strategy.value["type"]
                  }
              }
            }
        }
        dynamic "eventbridge_event_bus_parameters" {
          for_each = target_parameters.value.eventbridge_event_bus_parameters
            content {
              detail_type = eventbridge_event_bus_parameters.value["detail_type"]
              endpoint_id = eventbridge_event_bus_parameters.value["endpoint_id"]
              resources   = eventbridge_event_bus_parameters.value["resources"]
              source      = eventbridge_event_bus_parameters.value["source"]
              time        = eventbridge_event_bus_parameters.value["time"]
            }
        }
        dynamic "http_parameters" {
          for_each = target_parameters.value.http_parameters
            content {
              header_parameters       = http_parameters.value["header_parameters"]
              path_parameter_values   = http_parameters.value["path_parameter_values"]
              query_string_parameters = http_parameters.value["query_string_parameters"]
            }
        }
        dynamic "kinesis_stream_parameters" {
          for_each = target_parameters.value.kinesis_stream_parameters
            content {
              partition_key = kinesis_stream_parameters.value["partition_key"]
            }
        }
        dynamic "lambda_function_parameters" {
          for_each = target_parameters.value.lambda_function_parameters
            content {
              invocation_type = lambda_function_parameters.value["invocation_type"]
            }
        }
        dynamic "redshift_data_parameters" {
          for_each = target_parameters.value.redshift_data_parameters
            content {
              database           = redshift_data_parameters.value["database"]
              db_user            = redshift_data_parameters.value["db_user"]
              secret_manager_arn = redshift_data_parameters.value["secret_manager_arn"]
              sqls               = redshift_data_parameters.value["sqls"]
              statement_name     = redshift_data_parameters.value["statement_name"]
              with_event         = redshift_data_parameters.value["with_event"]
            }
        }
        dynamic "sagemaker_pipeline_parameters" {
          for_each = target_parameters.value.sagemaker_pipeline_parameters
            content {
              dynamic "pipeline_parameter" {
                for_each = sagemaker_pipeline_parameters.value.pipeline_parameter
                  content {
                    name  = pipeline_parameter.value["name"]
                    value = pipeline_parameter.value["value"]
                  }
              }
            }
        }
        dynamic "sqs_queue_parameters" {
          for_each = target_parameters.value.sqs_queue_parameters
            content {
              message_deduplication_id = sqs_queue_parameters.value["message_deduplication_id"]
              message_group_id         = sqs_queue_parameters.value["message_group_id"]
            }
        }
        dynamic "step_function_state_machine_parameters" {
          for_each = target_parameters.value.step_function_state_machine_parameters
            content {
              invocation_type = step_function_state_machine_parameters.value["invocation_type"]
            }
        }
      }
  }
}
